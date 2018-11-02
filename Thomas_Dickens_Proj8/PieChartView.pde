class PieChartView{
  
  // this class will calculate the total percepitation by year, then calculate the percentage
  // of rainfall by month. Ideally, any data column should be able to be passed into this class
  // and have a pie chart plotted. 
  
  // fields
  float sumOfValues;
  int[] months;
  float[] pieValues;
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
    int numMonths = countMonthsInYear(this.dttm, this.year);
    this.months = new int[numMonths];
    this.pieValues = new float[numMonths];
    


    
    // first find the maximum for each year
    for (int i = 0; i < this.inputVals.length; i++){
        String targetString = String.valueOf(this.year);
      
       if(this.dttm[i].contains(targetString)){
         tempVals.add(Float.valueOf(this.inputVals[i]));
         
       }
    }
 
    
     
    this.sumOfValues = sumArray(tempVals);
    
    // Now to find the sum of the input value for each month
    for (int month = 0; month < numMonths; month++) {
      String targetMonth = "-" + String.valueOf(month + 1) + "-";
      ArrayList<Float> monthTemp = new ArrayList<Float>();
      months[month] = month + 1;
      
      // cycle through the date time values
      for (int i = 0; i < this.dttm.length; i ++){
          if (this.dttm[i].contains(targetMonth)){
                monthTemp.add(this.inputVals[i]);
          }
      }
      this.pieValues[month] = sumArray(monthTemp) / this.sumOfValues;
    }

  println(this.pieValues);
  } // end overloaded constructor

  
  //**********************************************************
  // PRIMARY METHODS
  //**********************************************************
  
  // code borrowed from https://processing.org/examples/piechart.html
  public void drawPie(float xLoc, float yLoc, float diameter){

    float lastAngle = 0;
    for (int i =0; i < this.pieValues.length; i++){
        float gray = map(i, 0, this.pieValues.length, 0, 255);
        fill(gray);
        arc(xLoc, yLoc, diameter, diameter, lastAngle, lastAngle+radians(this.pieValues[i]*360));
        lastAngle+= radians(this.pieValues[i]*360);
    }
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


// this method will count the unique months in the datetime string array. This assume that the date time
// values are of format yyyy-m-d
public int countMonthsInYear(String[] dttm, int year){
  int uniqueMonths = 0;
  
  for (int i = 0; i < 12; i++){
   String searchString = String.valueOf(year)+"-" + String.valueOf(i+1);
   
   for (int index = 0; index < dttm.length; index++){
    if (dttm[index].contains(searchString)){
      uniqueMonths+=1;
      break;
    }
   }
  
 }
 
 return uniqueMonths;
}


}
