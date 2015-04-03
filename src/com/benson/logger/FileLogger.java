package com.benson.logger;

import java.io.*;
import java.util.*;

public class FileLogger {
    
    public static String getLogFilePath(String prifix){
        String path = "/root/" + prifix + "_" + System.currentTimeMillis() + ".log";
        return path;
    }

    public static void log(String path, Map<String, String> paramMap) {
        List<String> keys = new ArrayList<String>(paramMap.keySet());
        Collections.sort(keys);
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = paramMap.get(key);
            try {
                value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            log(path, key + "=" + value);
        }        
    }
    
    public static void log(String path, String msg) {
        FileWriter fw = null;
        try {
            fw = new FileWriter(path, true);
            fw.write("\n" + msg);
            fw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
