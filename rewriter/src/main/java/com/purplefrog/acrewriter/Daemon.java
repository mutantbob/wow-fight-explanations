package com.purplefrog.acrewriter;

import com.purplefrog.acrewriter.*;
import com.purplefrog.apachehttpcliches.*;
import org.apache.http.protocol.*;
import org.apache.log4j.*;

import java.io.*;
import java.util.concurrent.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/18/13
 * Time: 5:11 PM
 * To change this template use File | Settings | File Templates.
 */
public class Daemon
{
    public static void main(String[] argv)
        throws IOException
    {
        BasicConfigurator.configure();


        HttpRequestHandlerRegistry registry = new HttpRequestHandlerRegistry();
        registry.register("/*", new RootHandler());

        int port = 7262;
        BasicHTTPAcceptLoop loop = new BasicHTTPAcceptLoop(port, registry, Executors.newFixedThreadPool(10));

        System.out.println("listening for connections on http://localhost:" + port + "/");

        loop.run();
    }
}
