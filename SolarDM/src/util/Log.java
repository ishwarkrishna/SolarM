package util;

import java.util.logging.Level;
import java.util.logging.Logger;

public class Log {
private static final String DM_LOGGER_NAME = "dm";
    
    private static Logger logger = null;

    /**
     * Return global logger
     */
    public static Logger getLogger() {
        if (logger == null) {
            logger = Logger.getLogger(DM_LOGGER_NAME);
            logger.setUseParentHandlers(false);
            logger.setLevel(Level.ALL);
        }
        return logger;
    }
    
    private static void write(Level level, String msg) {
        StackTraceElement[] stack = Thread.currentThread().getStackTrace();
        if (stack != null && stack.length > 3) {
            getLogger().logp(level, stack[3].getClassName(), stack[3].getMethodName(), msg);
        } else {
            getLogger().log(level, msg);
        }
    }

    public static void severe(String msg) {
        write(Level.SEVERE, msg);
    }

    public static void warning(String msg) {
        write(Level.WARNING, msg);
    }

    public static void info(String msg) {
        write(Level.INFO, msg);
    }

    public static void fine(String msg) {
        write(Level.FINE, msg);
    }
    
    public static void fineAndSysOut(String msg) {
    	System.out.println(msg);
        write(Level.FINE, msg);
    }
}
