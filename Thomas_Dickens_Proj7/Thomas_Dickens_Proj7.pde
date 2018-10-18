import java.net.*;
import java.io.*;
String apiURL = "http://api.openweathermap.org/data/2.5/forecast?id=4464368&APPID=5f4f1d0eb464d45251ada7cb4c2ee6d2&units=imperial";
APIConn weather;
WeatherVals weatherVals;
GraphVals tempGraph;
// Start weather API Class


void setup(){
  // basics
  size(800,800);
  
  
  // get the weather data
  try{
weather = new APIConn(apiURL);
  } catch ( Exception e) {}
 
 weatherVals = new WeatherVals(weather);

//  public GraphVals(float[] inputData, String [] dttm, float xStart, float yStart, float scaleVal){
tempGraph = new GraphVals(weatherVals.temp, weatherVals.dttm, 10, 100, width / weatherVals.temp.length);
 
 println(weatherVals.temp.length);
}

void draw(){
}
