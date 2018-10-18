class GraphVals{
  // class fields
  float[] plotVars;
  String[] dttm;
  float xStart;
  float yStart;
  float scaleVal;
  float maxVal;
  float minVal;
  
  // constructors
  //basic
  public GraphVals(){
    
  }
  
  public GraphVals(float[] inputData, String [] dttm, float xStart, float yStart, float scaleVal){
    this.plotVars = new float[inputData.length];
    this.plotVars = inputData;
    this.xStart = xStart;
    this.yStart = yStart;
    this.scaleVal = scaleVal;
    this.dttm = new String[dttm.length];
    this.dttm = dttm;
    
    // draw x-axis
    maxVal = max(this.plotVars);
    minVal = min(this.plotVars);
    line(this.xStart, height - this.yStart, this.scaleVal * this.plotVars.length, height - this.yStart);
    
    // draw y-axis
    line(this.xStart, height - (this.yStart), this.xStart, height - (this.yStart+this.maxVal*2));
    
    //plot float values via loop
    for (int i = 0; i < this.plotVars.length - 1; i++) {
    stroke(255, 200, 0);
    ellipse(this.xStart, height - (this.plotVars[i] + this.yStart), 3,3);
    line(this.xStart, height - (this.plotVars[i] + this.yStart), this.xStart+this.scaleVal, height - (this.plotVars[i+1] + this.yStart));
    
    if (this.plotVars[i] == this.minVal){
       textSize(12);
       textAlign(LEFT);
       fill(0,0,255);
       text(String.valueOf("Low of: " + this.plotVars[i]), this.xStart, height - (this.plotVars[i]-15 + this.yStart));
       text(String.valueOf("At: " + this.dttm[i]), this.xStart, height - (this.plotVars[i]-30 + this.yStart));

      }
      
     if (this.plotVars[i] == this.maxVal){
       textSize(12);
       textAlign(LEFT);
       fill(255,0,0);
       text(String.valueOf("High of: " + this.plotVars[i]), this.xStart, height - (this.plotVars[i]+30 + this.yStart));
       text(String.valueOf("At: " + this.dttm[i]), this.xStart, height - (this.plotVars[i]+15 + this.yStart));

    }
    
    this.xStart+=this.scaleVal;
    } // end for loop
       
    
  } // end constructor
  
  
}
