class BarGraphView{
 int[] maxTmp;
 int[] maxTmpWeek;
 int[] minTmp;
 int[] minTmpWeek;
 float xStart;
 float yStart;
 float scaleVal;
 float maxVal;
  public BarGraphView(){
  
  }
  
  public BarGraphView(DataImport bardata, float xStart, float yStart, float scaleVal){
    this.maxTmp = new int[bardata.maxTemp.length];
    this.maxTmp = bardata.maxTemp;
    this.maxTmpWeek = new int[(bardata.maxTemp.length)/7];
    this.minTmp = new int[bardata.minTemp.length];
    this.minTmp = bardata.minTemp;
    this.minTmpWeek = new int[(bardata.minTemp.length)/7];
    this.xStart = xStart;
    this.yStart = yStart;
    this.scaleVal = scaleVal;
    this.maxVal = maxVal;
    
    
    maxVal = max(this.maxTmp);
   
   // x axis
   stroke(0);
   line(xStart, height - yStart, width-xStart, height - yStart);
   stroke(175);
   for(int i = 10; i<=maxVal; i+=10){
     line(xStart, (height-yStart)-i, width-xStart, (height-yStart)-i);
   }
   // y axis
   stroke(0);
   line(xStart, height - (yStart), xStart, height - (yStart+this.maxVal));
   
   // Title & Labels
    textSize(9);
   fill(0);
   stroke(175);
   textAlign(RIGHT);
   text(int(maxVal), this.xStart-5, (height-yStart)-95);
   text(int(maxVal)-20, this.xStart-5, (height-yStart)-75);
   text(int(maxVal)-40, this.xStart-5, (height-yStart)-55);
   text(int(maxVal)-60, this.xStart-5, (height-yStart)-35);
   text(int(maxVal)-80, this.xStart-5, (height-yStart)-15);
   textSize(25);
   fill(0);
   textAlign(CENTER);
   text("Biweekly Min/Max Temperatures (°F)", width/2, height - yStart - maxVal-5);

    
    // Max Temp
    for(int i=0; i<maxTmp.length; i=i+14){
      fill(240, 10, 10);
      noStroke();
      int mult = 1;
      float rectWidth = (width / maxTmp.length);
      //float ypos = height - (maxTmp[i] * mult);
      if(i==0 || i==1){
      rect((xStart*2)+(rectWidth*i), height-yStart-this.maxTmp[i], scaleVal-20, maxTmp[i]);
      } else{
        rect(xStart+(rectWidth*i)+19, height-yStart-this.maxTmp[i], scaleVal-20, maxTmp[i]);
      }
    }
    
    // Min Temp
    for(int j=0; j<minTmp.length; j=j+14){
      fill(10, 10, 240);
      noStroke();
      int mult = 1;
      float rectWidth = (width / minTmp.length);
      //float ypos = (height - (minTmp[i] * mult));
      if(j==0 || j==1){
      rect((xStart*2)+(rectWidth*j), height-yStart-this.minTmp[j], scaleVal-20, minTmp[j]);
      } else{
        rect(xStart+(rectWidth*j)+19, height-yStart-this.minTmp[j], scaleVal-20, minTmp[j]);
      }
    }

  }
  
}
