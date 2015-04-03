package com.benson.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.ServletRequest;

public class RequestUtil {

    public static String getParameter(ServletRequest request,
            String parameterName) throws UnsupportedEncodingException {
        String parameterValue = request.getParameter(parameterName);
        if (parameterValue == null)
            return null;
        try {
            return new String(parameterValue.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
