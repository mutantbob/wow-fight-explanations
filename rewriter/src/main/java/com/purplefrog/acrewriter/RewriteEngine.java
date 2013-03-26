package com.purplefrog.acrewriter;

import com.purplefrog.jluadata.*;
import org.apache.log4j.*;

import java.io.*;
import java.text.*;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/26/13
 * Time: 1:15 PM
 * To change this template use File | Settings | File Templates.
 */
public class RewriteEngine
{
    private static final Logger logger = Logger.getLogger(RewriteEngine.class);

    public static String incorporateArbitraryCommands(String lua)
        throws IOException, ParseException
    {
        Map<String, Object> dict = new LuaParser(new StringReader(lua)).parseDictionary();
        Object x = dict.get("ArbitCommDB");

        if (x instanceof Map) {
            Map<String,Object> db = (Map<String,Object>) x;

            incorporateArbitraryCommands(db);

            dict.put("ArbitCommDB", db);
            return LuaDumper.dumpAsLuaDict(dict);

        } else {
            throw new ParseException("no variable declaration for ArbitCommDB", 0);
        }

    }

    public static Map<String,Object> incorporateArbitraryCommands(Map<String, Object> db)
    {
//        db.put("debug", "hail bob!");

        List<Object> commands = (List<Object>) deref(db, "profiles", "Default", "commands");
        incorporateAC(commands);

        return db;
    }

    public static void incorporateAC(List<Object> commands)
    {
        List<CannedScript> scripts = ScriptDatabase.getScripts();

        for (CannedScript cs : scripts) {
            incorporateAC(commands, cs);
        }
    }

    public static void incorporateAC(List<Object> commands, CannedScript cs)
    {
        try {
            String[] path = cs.getMenuPath();

            if (null == path) {
                logger.debug("script "+cs.f+" specifies no menu path");
                return;
            }

            incorporateAC(commands, path, 0, cs.getScriptText());
        } catch (Exception e) {
            logger.warn("malfunction incorporating script "+cs.f, e);
        }
    }

    public static void incorporateAC(List<Object> commands, String[] path, int cursor, String scriptText)
    {
        if (path.length <= cursor+1) {
            setOrAdd(commands, path[cursor], scriptText);
        } else {
            Map<String, Object> x = matchLabel(commands, path[cursor]);

            List<Object> sub;
            if (x==null) {
                x = new TreeMap<String, Object>();
                x.put("menulabel", path[cursor]);
                sub = new ArrayList<Object>();
                x.put("sub", sub);
                commands.add(x);
            } else {
                sub = (List<Object>) x.get("sub");
            }

            incorporateAC(sub, path, cursor+1, scriptText);
        }
    }

    private static void setOrAdd(List<Object> commands, String label, String scriptText)
    {
        Map<String, Object> x = matchLabel(commands, label);

        if (x==null) {
            x = new TreeMap<String, Object>();
            x.put("menulabel", label);
            commands.add(x);
        }

        x.put("script", scriptText);
    }

    public static Map<String, Object> matchLabel(List<Object> commands, String label)
    {
        for (Object menuItem_ : commands) {
            Map<String, Object> menuItem = (Map<String, Object>) menuItem_;

            if (label.equals(menuItem.get("menulabel"))) {
                return menuItem;
            }
        }

        return null;
    }

    public static Object deref(Map<String, Object> db, String... path)
    {
        Object rval = db;

        for (String s : path) {
            Map m = (Map) rval;
            rval = m.get(s);
        }

        return rval;
    }
}
