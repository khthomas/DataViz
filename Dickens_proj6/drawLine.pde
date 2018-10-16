void drawLine(float[] plotVars, float xStart, float yStart, float scaleVal){
  
  // draw x and y axis for the temperature variables
  //x-axis
  strokeWeight(2);
  stroke(0);  
  float maxVal = max(plotVars);
  float minVal = min(plotVars);
  line(xStart, height - yStart, scaleVal * plotVars.length, height - yStart);
  
  //y-axis
  line(xStart, height - (yStart), xStart, height - (yStart+maxVal*2));
  
  //the goal of this function is to allow users to pass an array and have it plot the values across the screen.
  for (int i = 0; i < plotVars.length - 1; i++){
    stroke(255, 200, 0);
    //fill(0, 200, 5);
    ellipse(xStart, height - (plotVars[i] + yStart), 3,3);
    line(xStart, height - (plotVars[i] + yStart), xStart+scaleVal, height - (plotVars[i+1] + yStart));
    
    if (plotVars[i] == minVal){
       textSize(12);
       textAlign(LEFT);
       fill(0,0,255);
       text(String.valueOf("Low of: " + plotVars[i]), xStart, height - (plotVars[i]-15 + yStart));
       text(String.valueOf("At: " + dttm[i]), xStart, height - (plotVars[i]-30 + yStart));

    }
    
    
    if (plotVars[i] == maxVal){
       textSize(12);
       textAlign(LEFT);
       fill(255,0,0);
       text(String.valueOf("High of: " + plotVars[i]), xStart, height - (plotVars[i]+30 + yStart));
       text(String.valueOf("At: " + dttm[i]), xStart, height - (plotVars[i]+15 + yStart));

    }
    
    xStart+=scaleVal;
    
  }
  

  
  
}
