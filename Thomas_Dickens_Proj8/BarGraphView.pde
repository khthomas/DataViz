class BarGraphView{
 int[] maxTmp;
 int[] minTmp;
 int[] meanTmp;
 
  public BarGraphView(){
  
  }
  
  public BarGraphView(DataImport bardata){
    this.maxTmp = new int[bardata.maxTemp.length];
    this.maxTmp = bardata.maxTemp;
    this.minTmp = new int[bardata.minTemp.length];
    this.minTmp = bardata.minTemp;
    this.meanTmp = new int[bardata.meanTemp.length];
    this.meanTmp = bardata.meanTemp;
    
    // Max Temp
    for(int i=0; i<maxTmp.length; i=i+7){
      fill(240, 10, 10);
      stroke(255);
      int mult = 1;
      float rectWidth = (width / maxTmp.length)*2;
      float ypos = height - (maxTmp[i] * mult);
      rect((rectWidth*i), ypos, rectWidth, ypos);
    }
    
    // Min Temp
    for(int i=0; i<minTmp.length; i=i+7){
      fill(10, 10, 240);
      stroke(255);
      int mult = 1;
      float rectWidth = (width / minTmp.length)*2;
      float ypos = height - (minTmp[i] * mult);
      rect((rectWidth*i), ypos, rectWidth, ypos);
    }
    
  }
  
}
