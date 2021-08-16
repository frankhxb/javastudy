package com.netclient;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;

public class HelloClient {
    public static void main(String[] args){

        OkHttpClient client = new OkHttpClient();
        String url = "http://localhost:8080/helloword";
        String result = "";


        Request request = new Request.Builder()
                .url(url)
                .build();

        try (Response response = client.newCall(request).execute()) {
            result = response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(String.format("call hello result:{}", result));
    }

}
