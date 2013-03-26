package com.purplefrog.acrewriter;

import java.io.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/26/13
 * Time: 2:23 PM
 * To change this template use File | Settings | File Templates.
 */
public class Util
{
    public static String slurp(Reader r)
        throws IOException
    {
        StringBuilder rval = new StringBuilder();

        char[] buffer = new char[4<<10];

        while (true) {
            int n = r.read(buffer);
            if (n<1)
                break;
            rval.append(buffer, 0, n);
        }

        return rval.toString();
    }
}
