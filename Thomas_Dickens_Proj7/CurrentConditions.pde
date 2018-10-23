class CurrentConditions {
  
  float xStart;
  float yStart;
  String[] dttm;
  float[] plotVars; // this acts as the y-value
  float scaleVal;
  PShape plotVal;
  int count;
  
  
  
  // default constructor
  public CurrentConditions(){
    
  }
  
  // Overloaded
    public CurrentConditions(float[] plotVars, String[] dttm, float xStart, float yStart, float scaleVal, int count){
      this.xStart = xStart;
      this.yStart = yStart;
      this.plotVars = new float[plotVars.length];
      this.plotVars = plotVars;
      this.dttm = new String[dttm.length];
      this.dttm = dttm;
      this.scaleVal = scaleVal;
      this.count = count;
      println(this.count);
      
      if (this.count == 0){
       this.xStart += 0;
      } else {
       this.xStart += count * this.scaleVal; 
      }

  }
  
  PShape drawCurrent(){
   stroke(255, 200, 0);
  this.plotVal = createShape(ELLIPSE, this.xStart, height - (this.plotVars[count] + this.yStart), 15,15);
  return(this.plotVal);
  }
  
  
}
