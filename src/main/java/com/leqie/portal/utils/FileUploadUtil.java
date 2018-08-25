package com.leqie.portal.utils;

import static com.leqie.portal.utils.HttpHelper.getHttpClient;

import java.io.File;
import java.io.IOException;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SuppressWarnings("deprecation")
public class FileUploadUtil {
	
    private static Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

    public static String singleSubmitPost(String url, File file) {
        String response = "";
        CloseableHttpResponse closeableResponse = null;
        CloseableHttpClient client = getHttpClient();
        try {
            HttpPost httppost = new HttpPost(url);
            MultipartEntity reqEntity = new MultipartEntity();
            reqEntity.addPart("file", new FileBody(file));
            httppost.setEntity(reqEntity);
            closeableResponse = client.execute(httppost);
            if (closeableResponse == null || closeableResponse.getStatusLine() == null) {
                logger.info("SFDC response is null");
                return response;
            }
            int statusCode = closeableResponse.getStatusLine().getStatusCode();

            logger.info("Status:" + statusCode);
            if (closeableResponse.getEntity() != null) {
                response = EntityUtils.toString(closeableResponse.getEntity());
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

    public static String multiSubmitPost(String url, File[] files) {
        String response = "";
        CloseableHttpResponse closeableResponse = null;
        CloseableHttpClient client = getHttpClient();

        try {

            HttpPost httppost = new HttpPost(url);
            /*FileBody file36 = new FileBody(new File(file36Path));
            FileBody file48 = new FileBody(new File(file48Path));
            FileBody file72 = new FileBody(new File(file72Path));
            FileBody file96 = new FileBody(new File(file96Path));
            FileBody file144 = new FileBody(new File(file144Path));*/

            MultipartEntity reqEntity = new MultipartEntity();

            for (int i = 0; i < files.length; i++) {
                reqEntity.addPart(files[i].getName(), new FileBody(files[i]));
            }
            /*reqEntity.addPart("file36", file36);// file36为请求后台的File upload;属性
            reqEntity.addPart("file48", file48);
            reqEntity.addPart("file72", file72);
            reqEntity.addPart("file96", file96);
            reqEntity.addPart("file144", file144);*/

            httppost.setEntity(reqEntity);

            closeableResponse = client.execute(httppost);

            if (closeableResponse == null || closeableResponse.getStatusLine() == null) {
                logger.info("SFDC response is null");
                return response;
            }
            int statusCode = closeableResponse.getStatusLine().getStatusCode();

            logger.info("Status:" + statusCode);
            if (closeableResponse.getEntity() != null) {
                response = EntityUtils.toString(closeableResponse.getEntity());
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
}
