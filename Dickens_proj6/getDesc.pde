
public String[] getDesc(JSONArray jo, String level) {
  
  String[] output = new String[jo.size()]; 
  //JSONArray val2;
  
  for ( int i = 0; i < jo.size(); i++) {
    JSONObject value = jo.getJSONObject(i);
    //val2 = value.getJSONArray();
    String temp = value.getString(level);
    output[i] = temp;
  }

  return output;
}
