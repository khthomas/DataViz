
public String[] getWeatherDescription(JSONArray jo) {
  
  String[] output = new String[jo.size()]; 
  //JSONArray val2;
  
  for ( int i = 0; i < jo.size(); i++) {
    JSONObject value = jo.getJSONObject(i);
    JSONArray val2 = value.getJSONArray("weather");
    JSONObject temp = val2.getJSONObject(0);
    String temp2 = temp.getString("main");
    output[i] = temp2;
  }

  return output;
}
