class PieChartView{
  
  // this class will calculate the total percepitation by year, then calculate the percentage
  // of rainfall by month. Ideally, any data column should be able to be passed into this class
  // and have a pie chart plotted. 
  
  // fields
  float sumOfValues;
  int[] months;
  float[] pieValues;
  float[] inputVals;
  int[] intVals;
  String[] dttm;
  int year;
  int numMonths;
  Controller controller;
  PVector loc;
  float dim;
  color[] pieColors;
  

  // ****************************************************
  // CONSTRUCTORS
  //*****************************************************
  // basic
  public PieChartView(){
    
  }
    
  // overloaded
  public PieChartView(Controller controller, float[] floatVals, String[] datetime, int year, PVector loc){
    this.dttm = datetime;
    this.inputVals = floatVals;
    this.year = year;
    ArrayList<Float> tempVals = new ArrayList<Float>();
    this.numMonths = countMonthsInYear(this.dttm, this.year);
    this.months = findMonthsInYear(this.dttm, this.year, this.numMonths).clone();
    this.pieValues = new float[numMonths];
    this.controller = controller;
    this.loc = loc;
    this.pieColors = new color[numMonths];
    


    
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
      String targetMonth = "-" + String.valueOf(this.months[month]) + "-";
      ArrayList<Float> monthTemp = new ArrayList<Float>();
      //months[month] = month + 1;
      
      // cycle through the date time values
      for (int i = 0; i < this.dttm.length; i ++){
          if (this.dttm[i].contains(targetMonth)){
                monthTemp.add(this.inputVals[i]);
          }
      }
      this.pieValues[month] = sumArray(monthTemp) / this.sumOfValues;
      this.pieColors[month] = color(random(255), random(255), random(255));
    }

  } // end overloaded constructor
  
  //*****************************************************
  //this constructor will take an interger array as input
  //*****************************************************
    public PieChartView(Controller controller, int[] intVals, String[] datetime, int year, PVector loc){
    this.dttm = datetime;
    this.intVals = intVals;
    this.year = year;
    ArrayList<Float> tempVals = new ArrayList<Float>();
    this.numMonths = countMonthsInYear(this.dttm, this.year);
    this.months = findMonthsInYear(this.dttm, this.year, this.numMonths).clone();
    this.pieValues = new float[numMonths];
    this.controller = controller;
    this.loc = loc;
    this.pieColors = new color[numMonths];
    
    


    
    // first find the maximum for each year
    for (int i = 0; i < this.intVals.length; i++){
        String targetString = String.valueOf(this.year);
      
       if(this.dttm[i].contains(targetString)){
         tempVals.add(Float.valueOf(this.intVals[i]));
         
       }
    }
 
    
     
    this.sumOfValues = sumArray(tempVals);
    
    // Now to find the sum of the input value for each month
    for (int month = 0; month < numMonths; month++) {
      String targetMonth = "-" + String.valueOf(this.months[month]) + "-";
      ArrayList<Float> monthTemp = new ArrayList<Float>();
      //months[month] = month + 1;
      
      // cycle through the date time values
      for (int i = 0; i < this.dttm.length; i ++){
          if (this.dttm[i].contains(targetMonth)){
                monthTemp.add(Float.valueOf(this.intVals[i]));
          }
      }
      this.pieValues[month] = sumArray(monthTemp) / this.sumOfValues;
      this.pieColors[month] = color(random(255), random(255), random(255));

    }
    //println(this.pieValues);
    //println();
    //println(this.months);

  } // end overloaded constructor with interger array input

  
  //**********************************************************
  // PRIMARY METHODS
  //**********************************************************
  
  // code borrowed from https://processing.org/examples/piechart.html
  public void drawPie(float diameter, String title){

    float lastAngle = 0;
    float keyOffSet = 0;
    float xLoc = this.loc.x;
    float yLoc = this.loc.y;
    float keySize = diameter / 12 - 5;
    this.dim = diameter;
    for (int i =0; i < this.pieValues.length; i++){
        //float gray = map(i, 0, this.pieValues.length, 0, 255);
        //color rand = color(random(255), random(255), random(255));
        fill(this.pieColors[i]);
        arc(xLoc, yLoc, diameter, diameter, lastAngle, lastAngle+radians(this.pieValues[i]*360));
        lastAngle+= radians(this.pieValues[i]*360);
        
        // key information
        rect(xLoc + diameter / 2 + 10, yLoc - diameter /2 + keyOffSet, keySize,keySize);
        
        keyOffSet += keySize + 5;
        textSize(keySize);
        fill(0);
        textAlign(LEFT);
        text(whatMonth(this.months[i]), xLoc + diameter / 2 + keySize*2, yLoc - diameter /2 + keyOffSet - 5);
        
        // testing
        //rect(this.loc.x - diameter/2, this.loc.y - diameter/2, diameter, diameter);
    }
    
   // key information
   
    
   textSize(20);
   fill(0);
   textAlign(CENTER);
   text(title, xLoc, yLoc - diameter / 2 - 10);
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
   String searchString = String.valueOf(year)+"-" + String.valueOf(i+1) + "-";
   
   for (int index = 0; index < dttm.length; index++){
    if (dttm[index].contains(searchString)){
      uniqueMonths+=1;
      break;
    }
   }
  
 }
 
 return uniqueMonths;
}

// get the actual month values
public int[] findMonthsInYear(String[] dttm, int year, int numMonths){
  int[] foundMonths = new int[numMonths];
  int counter = 0;
  
  for (int i = 0; i < 12; i++){
     String searchString = String.valueOf(year) + "-" + String.valueOf(i+1) + "-"; 
     
       for (int index = 0; index < dttm.length; index++){
          if (dttm[index].contains(searchString)){
            foundMonths[counter] = i+1;
            counter++;
            break;
          }
          
    }    
  }
  return foundMonths;

}

// look up months: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/switch.html
public String whatMonth(int month){
  String monthString;
  switch(month) {
            case 1:  monthString = "January";
                     break;
            case 2:  monthString = "February";
                     break;
            case 3:  monthString = "March";
                     break;
            case 4:  monthString = "April";
                     break;
            case 5:  monthString = "May";
                     break;
            case 6:  monthString = "June";
                     break;
            case 7:  monthString = "July";
                     break;
            case 8:  monthString = "August";
                     break;
            case 9:  monthString = "September";
                     break;
            case 10: monthString = "October";
                     break;
            case 11: monthString = "November";
                     break;
            case 12: monthString = "December";
                     break;
            default: monthString = "Invalid month";
                     break;
    
  }
  
  return monthString;
  
}


// return boolean
public boolean isMouseInObject(PVector mouseLoc){
  //rect(this.loc.x - this.dim/2, this.loc.y - this.dim/2, this.dim, this.dim);
  if (mouseLoc.x >= this.loc.x - this.dim/2 && mouseLoc.x <= this.loc.x + this.dim/2){
  return true;
  }
  
  println(mouseLoc.x);
  println(this.loc.x);
  println(this.loc.x - this.dim/2);
  println(this.loc.x + this.dim/2);
 
 return false;
  
  
}
  

void mousePressed(){
  color c = get(mouseX, mouseY);
  int monthIndex = findIndex(this.pieColors, c);
  int theMonth = this.months[monthIndex];
  //println(theMonth);
  //println(c);
  
  controller.setSelectedMonth(theMonth); // convert color of pie chart to month
  
}

// function that finds the index of the color array
public int findIndex(color[] colorArray, color thisColor){
  
  for (int i = 0; i < colorArray.length; i++){
   if (colorArray[i] == thisColor){
    return i; 
   }
  }
  
  return 0;
}



}
