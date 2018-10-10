// this funtion will return an integer array. Tell the function which value you want to grab
// from the JSONArray. Note that this will only query from the "main" object.

public float[] getFloatValues(JSONArray jo, String level) {
  
  float[] output = new float[jo.size()]; 
  
  for ( int i = 0; i < jo.size(); i++) {
    JSONObject value = jo.getJSONObject(i);
    JSONObject val2 = value.getJSONObject("main");
    float temp = val2.getFloat(level);
    output[i] = temp;
  }

  return output;
}
