// imports
import java.net.*;
import java.io.*;
import java.util.ArrayList;

// API variables
String apiKey = "5f4f1d0eb464d45251ada7cb4c2ee6d2";
String urlBase = "http://api.openweathermap.org/data/2.5/forecast?id=";
String siteID = "4464368";
String urlEnd = "&APPID=";
String completeURL = urlBase + siteID + urlEnd + apiKey;

// JSON objects and JSON based variables
JSONObject payload = new JSONObject();
JSONObject city;
int cnt;
String cod;
float message;
JSONArray list;

// float values
float[] temp;
float[] humidity;
float[] pressure;

// string values
String[] dttm;

// Font values
PFont f;


void setup(){
 size(800,800);
 
 // call the urlConnection
 try{
   
   payload = urlCon(completeURL);
 
 } catch ( Exception e) {}
 
 // JSON keys: [city, cnt, cod, message, list]
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
 // float values
 temp = new float[list.size()];
 humidity = new float[list.size()];
 pressure = new float[list.size()];
 
 //temperatures from K to F
 temp = getFloatValues(list, "temp");
 float[] tempF = new float[temp.length];
 tempF = convertKtoF(temp);
 humidity = getFloatValues(list, "humidity");
 pressure = getFloatValues(list, "pressure");
 
 // string values
 dttm =  new String[list.size()];
 dttm = getDesc(list, "dt_txt");

//fonts
f = createFont("Arial", 12, true);


 
 println(tempF);
 println(temp);
 //println(humidity);
 //println(pressure);
 //println(dttm);
}

void draw(){
  
  for (int i = 0; i < temp.length; i++) {
    fill(255, 100, 100);
   ellipse(i*20 + 5, temp[i], 10, 10) ;
   
   fill(100, 150, 255);
   ellipse(i*20 + 5, humidity[i], 10, 10);
  }
  
// draw text
  for (int i = 0; i < dttm.length; i++){
  textFont(f, 12);
  fill(0);
  pushMatrix();
  translate(i * 20 + 5, 720);
  rotate(PI / 2);
  textAlign(CENTER);
  text(dttm[i], 0, 0);
  popMatrix();
  }
  
  }
  
