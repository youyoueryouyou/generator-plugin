package com.you.generator.core.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shicz on 2017/12/18.
 */
public class JdbcUtil {

    private  static JdbcUtil jdbcUtil = new JdbcUtil();

    public static JdbcUtil getInstance(){
        return jdbcUtil;
    }

    Connection conn = null;

    public void getConnection(String url, String user, String password) throws Exception
    {
        String jdbcurl = url+"?user="+user+"&password="+password+"&useUnicode=true&characterEncoding=UTF8&zeroDateTimeBehavior=convertToNull&autoReconnect=true";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcurl);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new Exception("get jdbc connection failure:"+e.toString());
        }
    }

    public void closeConnection()
    {
        if (conn != null)
        {
            try
            {
                conn.close();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    public Boolean executeUpdate(String sql)
            throws Exception
    {
        Statement stmt = conn.createStatement();
        boolean result = stmt.executeUpdate(sql) != -1;
        stmt.close();
        return result;
    }

    public List<Map<String, Object>> executeQuery(String sql)
            throws Exception
    {
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery(sql);
        ResultSetMetaData rsmd = result.getMetaData();
        int count = rsmd.getColumnCount();
        while (result.next())
        {
            Map<String, Object> resultMap = new HashMap<String, Object>();
            for (int i = 1; i <= count; i++)
            {
                resultMap.put(rsmd.getColumnName(i), result.getObject(i));
            }
            resultList.add(resultMap);
        }
        result.close();
        stmt.close();
        return resultList;
    }

    public List<String> executeColumn(String sql)
            throws Exception
    {
        List<String> resultList = new ArrayList<String>();
        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery(sql);
        ResultSetMetaData rsmd = result.getMetaData();
        int count = rsmd.getColumnCount();
        for (int i = 1; i <= count; i++)
        {
            resultList.add(rsmd.getColumnName(i));
        }
        result.close();
        stmt.close();
        return resultList;
    }
}
