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
    this.maxVal = maxVal;
    
    maxVal = max(maxT);
    
   
   //x axis
   stroke(0);
   line(xStart-3, height - yStart, scaleVal * this.minT.length+20, height - yStart);
   stroke(175);
   for(int i = 10; i<=maxVal; i+=10){
     line(xStart-3, (height-yStart)-i, scaleVal * this.minT.length+20, (height-yStart)-i);
   }
   
   // y axis
   stroke(0);
   line(xStart-3, height - (yStart), xStart-3, height - (yStart+this.maxVal));
   
   //labels
   textSize(9);
   fill(0);
   stroke(175);
   textAlign(RIGHT);
   text("100", this.xStart-5, (height-yStart)-95);
   text("80", this.xStart-5, (height-yStart)-75);
   text("60", this.xStart-5, (height-yStart)-55);
   text("40", this.xStart-5, (height-yStart)-35);
   text("20", this.xStart-5, (height-yStart)-15);

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

   // Title of graph
   textSize(25);
   fill(0);
   textAlign(CENTER);
   text("Min/Max Daily Temperatures (°F)", width/2, height - yStart - maxVal-10);

  }
  
}
