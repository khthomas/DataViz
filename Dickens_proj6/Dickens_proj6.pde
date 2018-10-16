import java.net.*;
import java.io.*;
import java.util.ArrayList;


//API Access variables
String apiKey = "5f4f1d0eb464d45251ada7cb4c2ee6d2";
String urlBase = "http://api.openweathermap.org/data/2.5/forecast?id=";
String siteID = "4464368";
String urlEnd = "&APPID=";
String units = "&units=imperial";
String completeURL = urlBase + siteID + urlEnd + apiKey + units;

//JSON Variables
JSONObject payload = new JSONObject();
JSONObject city;
int cnt;
String cod;
float message;
JSONArray list;
int count=0;

// scale values
float myScale;

// float[] values
float[] temp;
float[] humidity;
float[] pressure;

// string[] values
String[] dttm;
String[] desc;

//Background Images
PImage clouds;
PImage rainy;
PImage sun;

void setup(){
  clouds = loadImage("Clouds.jpg");
  rainy = loadImage("Rain.jpg");
  sun = loadImage("sun.png");
   size(800,800);
   //background(255);
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

// get date time values
// string values
 dttm =  new String[list.size()];
 dttm = getDesc(list, "dt_txt");
 
 desc = new String[list.size()];
 desc = getWeatherDescription(list);

// other vars
myScale = width/ temp.length;


}

void draw(){
    fill(255, 150);
  rect(-1,-1, width, height);
 
   //Load graphics based on Description
   if(desc[count].equals("Clouds") ==true){
     image(clouds, 0, 0);
   }
   
   if(desc[count].equals("Rain")==true){
     image(rainy, 0, 0);
   }
       
   if(desc[count].equals("Clear")==true){
     image(sun, height/8, height/20);
   }
   
   //Print Labels onscreen
   textSize(32);
   textAlign(CENTER);
   fill(0);
   text("Richmond, VA", width/2, height/2-32);
   
   textSize(12);
   textAlign(CENTER);
   fill(0);
   text("The temperature is "+temp[count]+"°F.", width/2, height/2);
   
   textSize(12);
   textAlign(CENTER);
   fill(0);
   text("Weather Description: "+desc[count], width/2, height/2 + 15);
   
    // Draw temperature graph
   drawLine(temp, 10, 100, myScale);

}

//Function to cycle through array based on mouse clicks
void mousePressed(){
  if(count<temp.length-1){ //Check if count is within bounds of the array length
    count+=1;
  }
  else{  //Restart Loop before going out of bounds
    count=0;
  }
}
