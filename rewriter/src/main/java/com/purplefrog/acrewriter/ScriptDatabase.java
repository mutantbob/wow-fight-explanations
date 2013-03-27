package com.purplefrog.acrewriter;

import org.apache.log4j.*;

import java.io.*;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: thoth
 * Date: 3/26/13
 * Time: 2:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class ScriptDatabase
{
    private static final Logger logger = Logger.getLogger(ScriptDatabase.class);

    public static List<CannedScript> getScripts()
    {
        List<CannedScript> rval = new ArrayList<CannedScript>();
        recurseGetScripts(rval, new File("/usr/local/wow-fight-explanations/en/"));
        return rval;
    }

    public static void recurseGetScripts(List<CannedScript> dst, File dir)
    {
        logger.debug("scanning "+dir);
        File[] subs = dir.listFiles();
        if (null==subs)
            return;

        Arrays.sort(subs);

        for (File sub : subs) {

            if (sub.isFile() && sub.getName().toLowerCase().endsWith(".lua")) {
                logger.debug("found script "+sub);
                dst.add(new CannedScript(sub));

            } else if (sub.isDirectory()) {
                recurseGetScripts(dst, sub);

            } else {
                logger.debug("ignoring "+sub);
            }
        }
    }

    public static class Statistics
    {
        int countWithPath =0;
        int countWithoutPath = 0;
        int countExplosions=0;

        public Statistics()
        {
            this(getScripts());
        }

        public Statistics(List<CannedScript> scripts)
        {
            for (CannedScript cs : scripts) {
                try {
                    if (null == cs.getMenuPath()) {
                        countWithoutPath++;
                    } else {
                        countWithPath++;
                    }
                } catch (Exception e) {
                    logger.warn("malfunction checking canned script", e);
                    countExplosions++;
                }
            }
        }

        public String report()
        {
            return countWithPath+" scripts for the menu.\n"+
                countWithoutPath+" scripts with no path specification\n"
                + ( countExplosions==0 ? ""
                : (countExplosions+" scripts trigger explosions\n") );
        }
    }
}
