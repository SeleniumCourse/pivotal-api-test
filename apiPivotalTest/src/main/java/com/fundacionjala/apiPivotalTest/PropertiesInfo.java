package com.fundacionjala.apiPivotalTest;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;


public class PropertiesInfo {

    private static final Logger LOGGER = Logger.getLogger(PropertiesInfo.class);

    private static final String PIVOTAL_PROPERTIES = "pivotal.properties";

    private static final String TOKEN = "token";

    private static final String PROXY_HOST = "proxyHost";

    private static final String PROXY_PORT = "proxyPort";

    private static PropertiesInfo instance;

    private Properties properties;

    private PropertiesInfo() {
        loadProperties();
    }

    public static PropertiesInfo getInstance() {
        if (instance == null) {
            instance = new PropertiesInfo();
        }
        return instance;
    }

    private void loadProperties() {
        properties = new Properties();
        try {
            FileInputStream fileInputStream = new FileInputStream(PIVOTAL_PROPERTIES);
            properties.load(fileInputStream);
            fileInputStream.close();
            LOGGER.info("Properties file loaded.");
        } catch (FileNotFoundException e) {
            LOGGER.fatal("Properties file not found. " + e.getMessage());
        } catch (IOException e) {
            LOGGER.fatal("Input output exception; Error loading the properties file. " + e.getMessage());
        }
    }

    private String getProperty(String propertyKey) {
        return properties.getProperty(propertyKey);
    }

    public String getBaseUrl() {
        return getProperty("urlApi");
    }

    public String getToken() {
        return getProperty(TOKEN);
    }

    public String getProxyHost() {
        return getProperty(PROXY_HOST);
    }

    public String getProxyPort() {
        return getProperty(PROXY_PORT);
    }

    public String getProxy() {
        String proxy = new StringBuilder().append("http://")
                .append(getProxyHost())
                .append(":")
                .append(getProxyPort()).toString();
        return proxy;
    }

}
