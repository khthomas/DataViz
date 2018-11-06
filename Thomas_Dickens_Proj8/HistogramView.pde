class HistogramView{

// Properties
int[] summerMinTemp;
int[] summerMaxTemp;
int[] summerMeanTemp;
int[] frequencyMin;
int[] frequencyMax;
int[] frequencyMean;
float xStart;
float yStart;
float maxVals;
float scaleVal;


// Constructors
  public HistogramView(){
  }
  
  public HistogramView(DataImport data, float xStart, float yStart, float scaleVal){
    this.summerMinTemp = new int[96];    
    this.summerMaxTemp = new int[96];
    this.summerMeanTemp = new int[96];
    this.frequencyMin = new int[96];
    this.frequencyMax = new int[96];
    this.frequencyMean = new int[24];
    this.xStart = xStart;
    this.yStart = yStart;
    this.maxVals = maxVals;
    this.scaleVal = scaleVal;
    
    int[] earlySummer = new int[10];
    int[] lateSummer = new int[84];
    int minValMeanTemp; 
    int maxValMeanTemp;
    int init = 0;
    int count = 0;
        
    // Get Values
    for(int i=355; i<data.meanTemp.length; i++){
        earlySummer[count] = data.meanTemp[i];
        count++;
    }
    
    for(int k=0; k<lateSummer.length; k++){
      lateSummer[k] = data.meanTemp[k]; 
    }
    
    summerMeanTemp = concat(earlySummer, lateSummer);
    minValMeanTemp = min(summerMeanTemp);
    maxValMeanTemp = max(summerMeanTemp);
    
    //Get Frequency
    
    for(int a = minValMeanTemp; a<=maxValMeanTemp; a++){
      count = 0;
      
      for(int b = 0; b < summerMeanTemp.length; b++){
        if(summerMeanTemp[b] == a){
        count++;
        }
      }
      frequencyMean[init] = count;
      init++;
    }

  float sum = 0;
  float avgSummerTemp;
  for(int f = 0; f<summerMeanTemp.length; f++){
    sum += summerMeanTemp[f]; 
  }
  
  avgSummerTemp = sum/summerMeanTemp.length;
  
    //Title and Labels
        maxVals = max(this.frequencyMean)*10;
   
   // x axis
   stroke(0);
   line(xStart, height - yStart, width-xStart, height - yStart);

   // y axis
   stroke(0);
   line(xStart, height - (yStart), xStart, height - (yStart+this.maxVals));
      
   // Title & Labels
    textSize(9);
   fill(0);
   stroke(175);
   textAlign(RIGHT);
   text(int(maxVals)/10, this.xStart-5, (height-yStart)-95);
   text((int(maxVals)-20)/10, this.xStart-5, (height-yStart)-75);
   text((int(maxVals)-40)/10, this.xStart-5, (height-yStart)-55);
   text((int(maxVals)-60)/10, this.xStart-5, (height-yStart)-35);
   text((int(maxVals)-80)/10, this.xStart-5, (height-yStart)-15);
   textSize(25);
   fill(0);
   textAlign(CENTER);
   text("Histogram of Summer Temperature Frequencies", width/2, height - yStart - maxVals-5);
    
    //Display Histogram
    for(int i=0; i<frequencyMean.length; i++){
      fill(10, 240, 220);
      noStroke();
      //int mult = 1;
      float rectWidth = (width / frequencyMean.length);
      //float ypos = height - (maxTmp[i] * mult);
      if(i==0 || i==1){
      rect((xStart*2)+(rectWidth*i), height-yStart-(this.frequencyMean[i]*10), scaleVal-20, frequencyMean[i]*10);
      } else{
        rect(xStart+(rectWidth*i), height-yStart-(this.frequencyMean[i]*10), scaleVal-50, frequencyMean[i]*10);
      }
    }
   stroke(200);
   for(int i = 10; i<=maxVals; i+=10){
     line(xStart, (height-yStart)-i, width-xStart, (height-yStart)-i);
   }
 }
  
}
