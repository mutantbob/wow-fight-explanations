package com.purplefrog.acrewriter;

import java.io.*;
import java.util.regex.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/26/13
 * Time: 2:03 PM
 * To change this template use File | Settings | File Templates.
 */
public class CannedScript
{
    public final File f;
    public final String tag;
    private String scriptText = null;

    public CannedScript(File f, String tag)
    {
        this.f = f;
        this.tag = tag;
    }

    public String[] getMenuPath()
        throws IOException
    {
        String rval = getMenuPathRaw();
        if (null == rval)
            return null;

        return rval.split("/");
    }

    public String getMenuPathRaw()
        throws IOException
    {
        String text = getScriptText();

        return extractMenuPath(text);
    }


    public String getScriptText()
        throws IOException
    {
        if (null==scriptText) {
            scriptText = Util.slurp(new FileReader(f));
        }

        return scriptText;
    }



    public static final Pattern ACMENU_PATTERN = Pattern.compile("^\\s*--\\s*ACmenu\\s*=\\s*(.*?)\\s*$", Pattern.MULTILINE);

    /**
     * Scan the LUA for a line of the form "--ACmenu=stuff" and return "stuff"
     * @param luaText
     * @return
     */
    public static String extractMenuPath(String luaText)
    {
        Matcher m = ACMENU_PATTERN.matcher(luaText);
        if (m.find()) {
            return m.group(1);
        }
        return null;
    }

}
