class APIConn{
//API Access variables
String url;
JSONObject payload; 

 
 // constructors
 public APIConn() throws Exception{
   
 }
 
 public APIConn(String url) throws Exception{
  this.url = url;
  
  URL requestedURL = new URL(this.url);
  URLConnection rc = requestedURL.openConnection();
  BufferedReader result = new BufferedReader(new InputStreamReader( rc.getInputStream()));
  String outputString = result.readLine();
  JSONObject output = parseJSONObject(outputString); 
  
  this.payload = output;
  
 }


 
}
