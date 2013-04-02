package com.purplefrog.acrewriter;

import com.purplefrog.apachehttpcliches.*;
import com.purplefrog.httpcliches.*;
import org.apache.commons.fileupload.*;
import org.apache.http.*;
import org.apache.http.entity.*;
import org.apache.http.protocol.*;
import org.apache.log4j.*;
import org.stringtemplate.v4.*;

import javax.jws.*;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/18/13
 * Time: 5:15 PM
 * To change this template use File | Settings | File Templates.
 */
public class RootHandler
    implements HttpRequestHandler
{
    private static final Logger logger = Logger.getLogger(RootHandler.class);

    @Override
    public void handle(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext)
    {
        RequestLine rl = httpRequest.getRequestLine();

        EntityAndHeaders x ;
        try {
            URI uri =  new URI(rl.getUri());
            String path = uri.getPath();
            if (path.equals("/")) {
                x = rootPage();
            } else if (path.equals("/rewrite")) {
                x = rewrite(httpRequest);

            } else if (path.equals("/raw/")) {
                x = getRaw(uri, httpRequest, httpContext);

            } else {
                x = EntityAndHeaders.plainPayload(404, "Page not found\n"+ path, "text/plain");
            }
        } catch (Exception e) {
            logger.warn("malfunction computing result", e);
            x = EntityAndHeaders.plainPayload(500, "I am full of explosions\n"+e.getMessage(), "text/plain");

        }

        x.apply(httpResponse);
    }

    public EntityAndHeaders getRaw(URI uri, HttpRequest httpRequest, HttpContext ctx)
        throws URISyntaxException, IOException, IllegalAccessException, CGIWebMethod.CGISOAPTransformException, InvocationTargetException
    {
        EntityAndHeaders x = ApacheCGIWebMethod.processThingus(this, httpRequest, uri.getPath(), ctx);
        return x;
    }

    @WebMethod(operationName = "/raw/")
    public EntityAndHeaders doRaw(@WebParam(name="menuPath") String menuPath,
                                  @WebParam CGIEnvironment env)
    {
        for (CannedScript cs : ScriptDatabase.getScripts()) {
            try {
                if (menuPath .equals(cs.getMenuPathRaw())) {
                    return EntityAndHeaders.plainTextPayload(200, cs.getScriptText());
                }
            } catch (IOException e) {
                logger.warn("malfunction parsing canned script", e);
            }
        }

        return EntityAndHeaders.plainTextPayload(404, "no script with menuPath="+menuPath+"\n");
    }

    private EntityAndHeaders rewrite(HttpRequest req)
        throws FileUploadException, IOException, java.text.ParseException
    {
        FileUploadBase base = new FileUpload(new FileItemFactory()
        {
            @Override
            public FileItem createItem(String fieldName, String contentType, boolean isFormField, String fileName)
            {
                return new MyFileItem(fieldName, contentType, isFormField, fileName);
            }
        });

        base.setSizeMax(1<<20);

        RequestContext ctx = new ApacheRequestContext(req);
        List<FileItem> list = base.parseRequest(ctx);

        String payload ;

        String lua = findUploadedFilePayload("lua", list);

        if (null==lua) {
            return EntityAndHeaders.plainPayload(500, "I was expecting a file upload for a parameter named 'lua' .", "text/plain");
        }

        payload = RewriteEngine.incorporateArbitraryCommands(lua);

        return EntityAndHeaders.plainPayload(200, payload, "text/plain");
    }

    private String findUploadedFilePayload(String fieldName, List<FileItem> list)
    {
        FileItem x = getFileItem_(fieldName, list);

        if (x==null)
            return null;

        return x.getString();
    }

    private FileItem getFileItem_(String fieldName, List<FileItem> list)
    {
        for (FileItem fileItem : list) {
            if (fieldName .equals(fileItem.getFieldName()) ) {
                return fileItem;
            }
        }
        return null;
    }

    public HttpEntity extractEntity(HttpRequest request_)
    {
        if (!(request_ instanceof HttpEntityEnclosingRequest)) {
            return null;
        }

        final HttpEntityEnclosingRequest request = (HttpEntityEnclosingRequest) request_;

        return request.getEntity();
    }

    public EntityAndHeaders rootPage()
        throws IOException
    {
        InputStream istr = getClass().getResourceAsStream("index.html");

        String payload = slurp(new InputStreamReader(istr));

        ST st = new ST(HTMLEnabledObject.makeSTGroup(true, '$', '$'), payload);

        st.add("templates", ScriptDatabase.onlyScriptsWithMenuPath());

        payload = st.render();

        ContentType cType = ContentType.TEXT_HTML;
        return new EntityAndHeaders(200, null, new StringEntity(payload, cType));
    }

    public static String slurp(Reader r)
        throws IOException
    {
        char[] buffer = new char[4<<10];

        StringBuilder rval = new StringBuilder();

        while (true) {
            int n = r.read(buffer);
            if (n<1)
                break;
            rval.append(buffer, 0, n);
        }

        return rval.toString();
    }

    public static byte[] slurp(InputStream istr)
        throws IOException
    {
        ByteArrayOutputStream rval = new ByteArrayOutputStream();

        byte[] buffer = new byte[4<<10];
        while (true) {
            int n = istr.read(buffer);
            if (n<1)
                break;

            rval.write(buffer, 0, n);
        }

        return rval.toByteArray();
    }

    private static class MyFileItem
        extends BasicFileItem
    {
        private ByteArrayOutputStream ostr = new ByteArrayOutputStream();

        public MyFileItem(String fieldName, String contentType, boolean formField, String fileName)
        {
            super(contentType, fieldName, fileName, formField);
        }

        @Override
        public InputStream getInputStream()
            throws IOException
        {
            throw new UnsupportedOperationException("NYI");
        }

        @Override
        public boolean isInMemory()
        {
            return true;
        }

        @Override
        public long getSize()
        {
            return ostr.size();
        }

        @Override
        public byte[] get()
        {
            return ostr.toByteArray();
        }

        @Override
        public void write(File file)
            throws Exception
        {
            throw new UnsupportedOperationException("NYI");

        }

        @Override
        public void delete()
        {
            throw new UnsupportedOperationException("NYI");

        }

        @Override
        public OutputStream getOutputStream()
            throws IOException
        {
            return ostr;
        }
    }

    private class ApacheRequestContext
        implements RequestContext
    {
        private final HttpRequest req;

        public ApacheRequestContext(HttpRequest req)
        {
            this.req = req;
        }

        @Override
        public String getCharacterEncoding()
        {
            String ce = ApacheHTTPCliches.getFirstHeader(req, "Content-Encoding");
            return ce;
        }

        @Override
        public String getContentType()
        {
            String contentType = ApacheHTTPCliches.getFirstHeader(req, "CONTENT-TYPE");
            return contentType;
        }

        @Override
        public int getContentLength()
        {
            String clen_ = ApacheHTTPCliches.getFirstHeader(req, "content-length");
            return Integer.parseInt(clen_);
        }

        @Override
        public InputStream getInputStream()
            throws IOException
        {
            HttpEntity en = extractEntity(req);
            return en.getContent();
        }
    }
}
