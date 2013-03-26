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
    public File f;
    private String scriptText = null;

    public CannedScript(File f)
    {
        this.f = f;
    }

    public String[] getMenuPath()
        throws IOException
    {
        String text = getScriptText();

        String rval = extractMenuPath(text);
        if (null == rval)
            return null;

        return rval.split("/");
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
