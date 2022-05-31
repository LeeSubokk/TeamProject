package com.web.zoomIn.controller;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

public class BusStation {
		  
	public void station() {
	        StringBuilder urlBuilder = new StringBuilder("http://api.gwangju.go.kr/xml/stationInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=4cZKQFGLj2H8FozNTI063G706Em1ECfdNRmTfRUHAuuPqylKMACLzGr01UqGKslCbGVs0kdGSLIKb3IKOuLeag%3D%3D"); /*Service Key*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        JSONObject json=new JSONObject();
	        json.put("data", sb);
		}
	}
