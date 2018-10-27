class BarChartAvgTemps{
 // the goal of this class is to allow the user to make a pie chart based off of any passed in variable from the
 // DataImport object. Ideally, I would like to make it such that the bar chart returns the average of the field by month
 // (maybe also by year). 
 
 // fields
 String desiredColumn;
 int[] monthAvgValue;
 String[] dttm;
 int[] months = new int[12]; //holds integers from 1 to 12
 float[] avgVals = new float[12]; // holds average monthly values
 float maxVal;
 
 
 //constructors
 //basic
 public BarChartAvgTemps(){
   
 }
 
 
 //overloaded
 public BarChartAvgTemps(DataImport dataObject){
   this.dttm = dataObject.dttm;
   this.monthAvgValue = dataObject.avgMaxTemp;
   
   // for every month go through the date time values, if they are of the correct month extract the 
   // value from the monthAvgValue array and put it in the temporary array. Then take the average value of
   // the temporary arry and put it into the avgVals array
   for (int month = 0; month < 12; month++) {
     String targetString = "-" + String.valueOf(month + 1) + "-";
     ArrayList<Integer> tempVals = new ArrayList<Integer>();
     months[month] = month + 1;
     
     // this section extracts the index of the string value 
     for (int i = 0; i < this.dttm.length; i++){
       if (this.dttm[i].contains(targetString)) {
         tempVals.add(this.monthAvgValue[i]);
       }
     }
     
     avgVals[month] = calcAvg(tempVals);
     
  
   }

 }//  end overloaded constructor
 
 //***********************************************************
 // START GRAPHING METHOD
 //*********************************************************** 
 void drawGraph(float xStart, float yStart, float scaleVal){
   maxVal = max(this.avgVals);
   
   // x axis
   stroke(0);
   line(xStart, height - yStart, scaleVal * this.avgVals.length, height - yStart);
   
   // y axis
   line(xStart, height - (yStart), xStart, height - (yStart+this.maxVal*2));
   
   //tick marks
   for (float tick = 0; tick <=10; tick ++){
     float thisTick = 0 + tick * (this.maxVal / 10);
     line(xStart - 5, height - yStart - thisTick, xStart+5, height - yStart - thisTick);
     textSize(10);
     textAlign(LEFT);
     text(String.valueOf(thisTick), xStart - 10, height - yStart - thisTick);
     
     
   }
   
   // start drawing the bars
   for (int i = 0; i < avgVals.length; i++) {
    fill(50, 255, 77);
    rect(xStart, height - yStart - this.avgVals[i], scaleVal - 20 , this.avgVals[i]);
    
    // text above bar chart
    
    
    xStart += scaleVal;
   }

 }
 
 
 
 //***********************************************************
 // START HELPER METHODS
 //***********************************************************
 // borrowed from https://stackoverflow.com/questions/10791568/calculating-average-of-an-array-list
 private float calcAvg(ArrayList <Integer> temp){
  Integer sum = 0;
    if (!temp.isEmpty()){
       for (Integer t : temp) {
        sum += t; 
       }
       
       return sum.floatValue() / temp.size();
    }
   
   return sum;
 }
 
}
 
 
  
