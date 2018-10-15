public JSONObject urlCon(String url) throws Exception{
  URL requestedURL = new URL(url);
  URLConnection rc = requestedURL.openConnection();
  BufferedReader result = new BufferedReader( new InputStreamReader( rc.getInputStream()));
  
  String outputString = result.readLine();
  JSONObject output = parseJSONObject(outputString);
  return output;
  
}
