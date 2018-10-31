class PieChartView{
  
  // this class will calculate the total percepitation by year, then calculate the percentage
  // of rainfall by month. Ideally, any data column should be able to be passed into this class
  // and have a pie chart plotted. 
  
  // fields
  float sumOfValues;
  int[] months =  new int[12];
  float[] pieValues = new float[12];
  float[] inputVals;
  String[] dttm;
  int year;

  // ****************************************************
  // CONSTRUCTORS
  //*****************************************************
  // basic
  public PieChartView(){
    
  }
    
  // overloaded
  public PieChartView(float[] floatVals, String[] datetime, int year){
    this.dttm = datetime;
    this.inputVals = floatVals;
    this.year = year;
    ArrayList<Float> tempVals = new ArrayList<Float>();


    
    // first find the maximum for each year
    for (int i = 0; i < this.inputVals.length; i++){
        String targetString = String.valueOf(this.year);
      
       if(this.dttm[i].contains(targetString)){
         tempVals.add(Float.valueOf(this.inputVals[i]));
         
       }
    }
    
    this.sumOfValues = sumArray(tempVals);
    
    // Now to find the sum of the input value for each month
    for (int month = 0; month < 12; month++) {
      String targetMonth = "-" + String.valueOf(month + 1) + "-";
      ArrayList<Float> monthTemp = new ArrayList<Float>();
      months[month] = month + 1;
      
      // cycle through the date time values
      for (int i = 0; i < this.dttm.length; i ++){
          if (this.dttm[i].contains(targetMonth)){
                monthTemp.add(this.inputVals[i]);
          }
      }
      pieValues[month] = sumArray(monthTemp) / this.sumOfValues;
    }
    
  } // end overloaded constructor
  
  
  //**********************************************************
  // PRIMARY METHODS
  //**********************************************************
  
  public void drawPie(){
    
    
  }
  
  
  
 //***********************************************************
 // START HELPER METHODS
 //***********************************************************
 // borrowed from https://stackoverflow.com/questions/5963847/is-there-possibility-of-sum-of-arraylist-without-looping
 
public float sumArray(ArrayList<Float> input){
  
  float sum = 0;
  
  for (float i : input) {
    sum = sum + i;
  }
  
  return sum;
}
  
  
}
