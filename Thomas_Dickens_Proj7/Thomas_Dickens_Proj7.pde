import java.net.*;
import java.io.*;
String apiURL = "http://api.openweathermap.org/data/2.5/forecast?id=4464368&APPID=5f4f1d0eb464d45251ada7cb4c2ee6d2&units=imperial";
int count = 0;
APIConn weather;
WeatherVals weatherVals;
GraphVals tempGraph;
WeatherReport WeatherReport;
CurrentConditions current;
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
 
  //  public WeatherReport(String[] desc, float[] temp, float[] hum, float[] press, String[] dttm, int count){
  WeatherReport = new WeatherReport(weatherVals.conditionDesc, weatherVals.temp, weatherVals.hum, weatherVals.press, weatherVals.dttm, count);
  
  //  public GraphVals(float[] inputData, String [] dttm, float xStart, float yStart, float scaleVal){
  tempGraph = new GraphVals(weatherVals.temp, weatherVals.dttm, 10, 100, width / weatherVals.temp.length);
  
   //public CurrentConditions(float[] plotVars, String[] dttm, float xStart, float yStart, float scaleVal, int count)
 current = new CurrentConditions(weatherVals.temp, weatherVals.dttm, 10, 100, width / weatherVals.temp.length, count);
 
 
 
 shape(current.drawCurrent());
}

void mousePressed(){
  if(count<weatherVals.temp.length-1){ //Check if count is within bounds of the array length
    count+=1;
  }
  else{  //Restart Loop before going out of bounds
    count=0;
  }
}
