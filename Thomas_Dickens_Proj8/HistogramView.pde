class HistogramView{

// Properties
int[] summerMinTemp;
int[] summerMaxTemp;
int[] summerMeanTemp;
int[] frequencyMin;
int[] frequencyMax;
int[] frequencyMean;


// Constructors
  public HistogramView(){
  }
  
  public HistogramView(DataImport data){
    this.summerMinTemp = new int[96];    
    this.summerMaxTemp = new int[96];
    this.summerMeanTemp = new int[96];
    this.frequencyMin = new int[96];
    this.frequencyMax = new int[96];
    this.frequencyMean = new int[24];
    
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
    
    //Sort Values
    //summerMinTemp = sort(summerMinTemp);
    //summerMaxTemp = sort(summerMaxTemp);
    //summerMeanTemp = sort(summerMeanTemp);
    
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
    
    //Display Histogram
      for(int i=0; i<frequencyMean.length; i++){
        fill(240, 10, 10);
        stroke(255);
        int mult = 1;
        float rectWidth = (width / frequencyMean.length)*(mult*2)/2;
        float ypos = height - (frequencyMean[i] * mult)*8;
        rect((rectWidth*i), ypos, rectWidth, ypos);
      }
    
    //Legend & Marginalia
    
    //Tests
    //println(data.meanTemp);
    //println(summerMeanTemp);
    //println(minValMeanTemp);
    //println(maxValMeanTemp);
    println(frequencyMean);
  }
  
}
