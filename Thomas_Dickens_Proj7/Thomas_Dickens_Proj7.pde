import java.net.*;
import java.io.*;
String apiURL = "http://api.openweathermap.org/data/2.5/forecast?id=4464368&APPID=5f4f1d0eb464d45251ada7cb4c2ee6d2&units=imperial";
APIConn weather;
WeatherVals weatherVals;
// Start weather API Class


void setup(){
  
  // get the weather data
  try{
weather = new APIConn(apiURL);
  } catch ( Exception e) {}
 
 weatherVals = new WeatherVals(weather);
 
 println(weatherVals.dttm);
}

void draw(){
}
