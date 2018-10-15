import java.net.*;
import java.io.*;
import java.util.ArrayList;

String apiKey = "5f4f1d0eb464d45251ada7cb4c2ee6d2";
String urlBase = "http://api.openweathermap.org/data/2.5/forecast?id=";
String siteID = "4464368";
String urlEnd = "&APPID=";
String units = "&units=imperial";
String completeURL = urlBase + siteID + urlEnd + apiKey + units;

JSONObject payload = new JSONObject();
JSONObject city;
int cnt;
String cod;
float message;
JSONArray list;
float[] temp;

int count=0;

void setup(){
 size(800,800);
   background (255);
 // call the urlConnection
 try{
   
   payload = urlCon(completeURL);
 
 } catch ( Exception e) {}
 
 // keys: [city, cnt, cod, message, list]
 // city is a JSON object
 // cnt is an int
 // cod is a JSON object
 // message is a JSON object
 // list is a JSON array
 city = payload.getJSONObject("city");
 cnt = payload.getInt("cnt");
 cod = payload.getString("cod");
 message = payload.getFloat("message");
 list = payload.getJSONArray("list");
 
// get all of the values from the arrays, will need several methods
// the method getFloatValues will get pretty much any value out of the main area
temp = new float[list.size()];
String[] rain = new String[list.size()];
temp = getFloatValues(list, "temp");
//println(temp);
}

void draw(){
  background(255);
  
   textSize(32);
   textAlign(CENTER);
   fill(0);
   text("Richmond, VA", width/2, height/2-32);
   
   textSize(12);
   textAlign(CENTER);
   fill(0);
   text("The temperature is "+temp[count]+"°F.", width/2, height/2);

}

void mousePressed(){
  count+=1;
}
