class LineGraphView{
  // class fields
  int[] minT;
  int[] maxT;
  float xInit;
  float yInit;
  float xStart;
  float yStart;
  float scaleVal;
  float maxVal;
  
  // constructors
  //basic
  public LineGraphView(){
    
  }
  
  public LineGraphView(DataImport input, float xStart, float yStart, float scaleVal){
    this.minT = new int[input.minTemp.length];
    this.minT = input.minTemp;
    this.maxT = new int[input.maxTemp.length];
    this.maxT = input.maxTemp;
    this.xInit = xStart;
    this.yInit = yStart;
    this.xStart = xStart;
    this.yStart = yStart;
    this.scaleVal = scaleVal;
    
    // draw x-axis
    maxVal = max(maxT);
    line(this.xStart, height - this.yStart, this.scaleVal * this.maxT.length, height - this.yStart);
    
    // draw y-axis
    line(this.xStart, height - (this.yStart), this.xStart, height - (this.yStart+this.maxVal*2));

    // Max Temperature
    for (int k = 0; k < this.maxT.length - 1; k++) {
      stroke(240, 0, 0);
      ellipse(this.xStart, height - (this.maxT[k] + this.yStart), 1,1);
      line(this.xStart, height - (this.maxT[k] + this.yStart), this.xStart+this.scaleVal, height - (this.maxT[k+1] + this.yStart));
    
      this.xStart+=this.scaleVal;
    } // end for loop
    
    this.xStart = xInit;
    this.yStart = yInit;

    // Min Temperature
    for (int j = 0; j < this.minT.length - 1; j++) {
      stroke(0, 10, 240);
      ellipse(this.xStart, height - (this.minT[j] + this.yStart), 1,1);
      line(this.xStart, height - (this.minT[j] + this.yStart), this.xStart+this.scaleVal, height - (this.minT[j+1] + this.yStart));
    
      this.xStart+=this.scaleVal;
    } // end for loop



  }
  
}
