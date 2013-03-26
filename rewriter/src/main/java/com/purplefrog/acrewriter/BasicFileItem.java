package com.purplefrog.acrewriter;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;

import java.io.*;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/18/13
 * Time: 6:16 PM
 * To change this template use File | Settings | File Templates.
 */
public abstract class BasicFileItem
    implements FileItem
{
    protected String fieldName;
    protected String contentType;
    protected boolean formField;
    protected String name;

    public BasicFileItem(String contentType, String fieldName, String fileName, boolean formField)
    {
        this.contentType = contentType;
        this.fieldName = fieldName;
        this.name = fileName;
        this.formField = formField;
    }

    @Override
    public String getContentType()
    {
        return contentType;
    }

    @Override
    public String getName()
    {
        return name;
    }

    @Override
    public abstract byte[] get();

    @Override
    public String getString(String encoding)
        throws UnsupportedEncodingException
    {
        return new String(get(), encoding);
    }

    public String getCharSet() {
        ParameterParser parser = new ParameterParser();
        parser.setLowerCaseNames(true);
        // Parameter parser can handle null input
        Map<String, String> params = parser.parse(getContentType(), ';');
        return params.get("charset");
    }

    @Override
    public String getString()
    {

        byte[] rawdata = get();
        String charset = getCharSet();
        if (charset == null) {
            charset = DiskFileItem.DEFAULT_CHARSET;
        }
        try {
            return new String(rawdata, charset);
        } catch (UnsupportedEncodingException e) {
            return new String(rawdata);
        }

    }

    @Override
    public String getFieldName()
    {
        return fieldName;
    }

    @Override
    public void setFieldName(String name)
    {
        fieldName = name;
    }

    @Override
    public boolean isFormField()
    {
        return formField;
    }

    @Override
    public void setFormField(boolean state)
    {
        formField = state;
    }

}
