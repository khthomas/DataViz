import java.net.*;
import java.io.*;
String apiURL = "http://api.openweathermap.org/data/2.5/forecast?id=4464368&APPID=5f4f1d0eb464d45251ada7cb4c2ee6d2&units=imperial";
int count = 0;
APIConn weather;
WeatherVals weatherVals;
GraphVals tempGraph;
WeatherReport WeatherReport;
// Start weather API Class


void setup(){
  // basics
//loadIVar = new loadIVar();
  size(800,800);
  
  
  // get the weather data
  try{
weather = new APIConn(apiURL);
  } catch ( Exception e) {}
 
 weatherVals = new WeatherVals(weather);

 println(weatherVals.temp.length);
}

void draw(){
  WeatherReport = new WeatherReport(weatherVals.conditionDesc, weatherVals.temp, weatherVals.hum, weatherVals.press, count);
  
  //  public GraphVals(float[] inputData, String [] dttm, float xStart, float yStart, float scaleVal){
  tempGraph = new GraphVals(weatherVals.temp, weatherVals.dttm, 10, 100, width / weatherVals.temp.length);
}

void mousePressed(){
  if(count<weatherVals.temp.length-1){ //Check if count is within bounds of the array length
    count+=1;
  }
  else{  //Restart Loop before going out of bounds
    count=0;
  }
}
