float[] convertKtoF(float[] inputVal){
  
  //probably makes more sense to make this a lambda expression
  float[] output = new float[inputVal.length]; 
  
  for (int i = 0; i < inputVal.length; i++){
  output[i] = (inputVal[i] -273.15) * 9/5 + 32;
  }
  
  return output;
  
}
