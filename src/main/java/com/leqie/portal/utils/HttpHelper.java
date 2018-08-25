package com.leqie.portal.utils;

import java.io.IOException;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.SocketConfig;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.LaxRedirectStrategy;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpHelper {
    private static Logger logger = LoggerFactory.getLogger(HttpHelper.class);
    private static PoolingHttpClientConnectionManager clientConnectionManager = null;
    private static CloseableHttpClient httpClient = null;
    public static final int MAX_RETRY_COUNT = 3;
    public static final int MAX_CONNECTIONS = 200;
    public static final int MAX_PER_ROUTE = 50;
    public static final int CONNECT_REQUEST_TIMEOUT = 5000;
    public static final int CONNECT_TIMEOUT = 10000;
    public static final int SOCKET_TIMEOUT = 20000;

    public static String httpPost(String url, NameValuePair[] data, String authorization, String acceptType) {
        String response = "";
        CloseableHttpResponse closeableResponse = null;

        CloseableHttpClient client = getHttpClient();
        HttpPost request = new HttpPost(url);
        request.addHeader("Authorization", authorization);
        request.addHeader("Accept", acceptType);


        try {
            HttpEntity requestEntity = null;
            if (data != null && data.length > 0) {
                //convert to http name value pair
                List<NameValuePair> pairList = new ArrayList<NameValuePair>();
                for (NameValuePair tmpPair : data) {
                    NameValuePair targetPair = new BasicNameValuePair(tmpPair.getName(), tmpPair.getValue());
                    pairList.add(targetPair);
                }

                requestEntity = new UrlEncodedFormEntity(pairList);
                request.setEntity(requestEntity);
            }

            //int statusCode =  httpClient.executeMethod(postMethod);
            closeableResponse = client.execute(request);
            if (closeableResponse == null || closeableResponse.getStatusLine() == null) {
                logger.info("SFDC response is null");
                return response;
            }
            int statusCode = closeableResponse.getStatusLine().getStatusCode();
            // Deal with status = 301 or 302
            if (statusCode == HttpStatus.SC_MOVED_PERMANENTLY
                    || statusCode == HttpStatus.SC_MOVED_TEMPORARILY) {
                // redirect to new location
                Header locationHeader = closeableResponse.getLastHeader("location");
                //.getResponseHeader("location");
                String location = null;
                if (locationHeader != null) {
                    location = locationHeader.getValue();
                    logger.info("HttpClientUtil: The request was redirected to:"
                            + location);
                    // Resends the request automatically
                    response = httpPost(location, data, authorization,
                            acceptType);
                } else {
                    logger.error("HttpClientUtil: Can't redirect because of null location value.");
                    throw new RuntimeException(
                            "HttpClientUtil: Can't redirect because of null location value.");
                }
            } else {
                logger.info("Status:" + statusCode);
                if (closeableResponse.getEntity() != null) {
                    response = EntityUtils.toString(closeableResponse.getEntity());
                }
            }
        } catch (IOException e) {
            logger.error("HttpClientUtil IOException: ");
            throw new RuntimeException(e.getMessage());
        } catch (RuntimeException e) {
            throw e;
        } finally {
            if (closeableResponse != null) {
                try {
                    closeableResponse.close();
                } catch (Exception e) {
                    logger.error("Close response error: ");
                }
            }


        }
        return response;
    }

    public synchronized static PoolingHttpClientConnectionManager getConnectionManager() {
        if (clientConnectionManager == null) {
            // Determines whether Nagle's algorithm is to be used. The Nagle's algorithm tries to conserve
            // bandwidth by minimizing the number of segments that are sent. When applications want to
            // decrease network latency and increase performance, they can disable Nagle's algorithm (by
            // enabling TCP_NODELAY). Data will be sent earlier, at the cost of an increase in bandwidth
            // consumption and number of packets.
            SocketConfig socketConfig = SocketConfig.custom()
                    .setTcpNoDelay(true)
                    .build();

            ConnectionConfig connectionConfig = ConnectionConfig.custom()
                    .setMalformedInputAction(CodingErrorAction.IGNORE)
                    .setUnmappableInputAction(CodingErrorAction.IGNORE)
                    .setCharset(Consts.UTF_8)
                    .build();

            clientConnectionManager = new PoolingHttpClientConnectionManager();
            clientConnectionManager.setMaxTotal(MAX_CONNECTIONS);
            clientConnectionManager.setDefaultMaxPerRoute(MAX_PER_ROUTE);
            clientConnectionManager.setDefaultSocketConfig(socketConfig);
            clientConnectionManager.setDefaultConnectionConfig(connectionConfig);

        }

        return clientConnectionManager;
    }

    public synchronized static CloseableHttpClient getHttpClient() {
        if (httpClient == null) {
            PoolingHttpClientConnectionManager connMgr = HttpHelper.getConnectionManager();

            // Connection Timeout (http.connection.timeout): the time to establish the connection with the remote host
            // Socket Timeout (http.socket.timeout): the time waiting for data – after the connection was established; maximum time of inactivity between two data packets
            // Connection Manager Timeout (http.connection-manager.timeout) – the time to wait for a connection from the connection manager/pool
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectionRequestTimeout(CONNECT_REQUEST_TIMEOUT)
                    .setConnectTimeout(CONNECT_TIMEOUT)
                    .setSocketTimeout(SOCKET_TIMEOUT)
                    .build();

            LaxRedirectStrategy redirectStrategy = new LaxRedirectStrategy();
            DefaultHttpRequestRetryHandler retryHandler = new DefaultHttpRequestRetryHandler(MAX_RETRY_COUNT, false);
            httpClient = HttpClients.custom()
                    .setConnectionManager(connMgr)
                    .setRedirectStrategy(redirectStrategy)
                    .setRetryHandler(retryHandler)
                    .setDefaultRequestConfig(requestConfig)
                    .build();
        }


        return httpClient;
    }

    public static String httpGet(String url) {
        String response = "";
        CloseableHttpResponse closeableResponse = null;
        try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpget = new HttpGet(url);
            closeableResponse = httpclient.execute(httpget);
            try {
                response = EntityUtils.toString(closeableResponse.getEntity());
                if (logger.isDebugEnabled()) {
                    logger.debug(response);
                }
            } finally {
                closeableResponse.close();
            }
        } catch (Exception e) {
            logger.error(url, e);
        }
        return response;
    }


}