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
    this.summerMinTemp = new int[data.minTemp.length];    
    this.summerMaxTemp = new int[data.maxTemp.length];
    this.summerMeanTemp = new int[data.meanTemp.length];
    this.frequencyMin = new int[data.minTemp.length];
    this.frequencyMax = new int[data.maxTemp.length];
    this.frequencyMean = new int[data.meanTemp.length];
    
    // Get Values
    
    //Sort Values
    summerMinTemp = sort(summerMinTemp);
    summerMaxTemp = sort(summerMaxTemp);
    summerMeanTemp = sort(summerMeanTemp);
    
    //Get Frequency

    
    //Display Histogram
    
    //Legend & Marginalia
  }
  
}
