class WeatherVals{
  
// fields
JSONObject reference;
JSONArray valArray;
float[] temp;
float[] hum;
float[] press;
String[] conditionDesc;
String[] dttm;

// constructors
//basic
 public WeatherVals(){
   
 }
 
 // pass an exisiting APIConn
 public WeatherVals(APIConn apiconn){
   //pass in an APIConn object and get the values for this class. Then do some manipulation of the 
   // this.valArray to get the needed data.
   // initialize class level fields 
  this.reference = apiconn.payload;
  this.valArray = this.reference.getJSONArray("list");
  this.temp = new float[this.valArray.size()];
  this.hum = new float[this.valArray.size()];
  this.press = new float[this.valArray.size()];
  this.conditionDesc = new String[this.valArray.size()];
  this.dttm = new String[this.valArray.size()];
  
  // get values for temperature, humidity, and pressure via looping through the "main" JSONObject
    for (int i = 0; i < this.valArray.size(); i++){
    JSONObject value = this.valArray.getJSONObject(i);
    JSONObject val2 = value.getJSONObject("main");
    this.temp[i] = val2.getFloat("temp");
    this.hum[i] = val2.getFloat("humidity");
    this.press[i] = val2.getFloat("pressure");
  }
  
  // get values for condition description
  for (int i = 0; i <  this.valArray.size(); i++){
    JSONObject value = this.valArray.getJSONObject(i);
    JSONArray val2 = value.getJSONArray("weather");
    JSONObject temp = val2.getJSONObject(0);
    String temp2 = temp.getString("main");
    this.conditionDesc[i] = temp2;
  }
  
  // get values for date time
  for (int i = 0; i < this.valArray.size(); i++){
     JSONObject value = this.valArray.getJSONObject(i);
    String tempVal = value.getString("dt_txt");
    this.dttm[i] = tempVal;
  }
  
 }


  
}
