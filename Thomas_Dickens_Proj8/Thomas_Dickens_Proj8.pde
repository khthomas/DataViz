import java.text.DecimalFormat;
import java.util.stream.*;
DecimalFormat df = new DecimalFormat("###.##");
String csvName = "KCLT.csv";
DataImport dataImport;
HistogramView weatherHist;
LineGraphView weatherLine;
BarGraphView weatherBar;
BarChartAvgTemps avgTemps;
PieChartView pieChart2014;
PieChartView pieChart2015;
Controller controller;

void setup(){
  background(255);
  size(800, 800);
  
  // Controller
  controller = new Controller();

  // Import CSV Data
  dataImport = new DataImport(csvName);

  //// Histogram of Summer temperatures
  //// HistogramView(DataImport data, float xStart, float yStart, float scaleVal)
 weatherHist = new HistogramView(dataImport, 20, 440, width/dataImport.meanTemp.length);

  //// Line Graph showing mean temperature
  //// LineGraphView(DataImport input, float xStart, float yStart, float scaleVal)
  weatherLine = new LineGraphView(dataImport, 20, 300, width/dataImport.meanTemp.length);
  
  //// Composite Bar Graph Showing min and Max temperatures every two weeks.
  //// BarGraphView(DataImport barData, float xStart, float yStart, float scaleVal);
  weatherBar = new BarGraphView(dataImport, 20, 10, width/dataImport.meanTemp.length);
  
  //// Bar chart of average temperature
  //// BarChartAvgTemps(DataImport dataObject)
  avgTemps = new BarChartAvgTemps(controller, dataImport);

  //// PieChart
  pieChart2014 = new PieChartView(controller, dataImport.avgPrecip, dataImport.dttm, 2014, new PVector(225,135));


  pieChart2015 = new PieChartView(controller, dataImport.avgPrecip, dataImport.dttm, 2015, new PVector(550,135));
  

 
} 

void draw(){
    //background(255);
    avgTemps.drawGraph(10, 160, width / avgTemps.avgVals.length);
    pieChart2014.drawPie(200, "Average Precipitation in 2014");
    pieChart2015.drawPie(200, "Average Precipitation in 2015");
    //pieChart2015.drawPie(500, 200, 200, "Average Precipitation in 2014");


}

void mousePressed(){
  //println("Mouse pressed in base");
  
  if (pieChart2014.isMouseInObject(new PVector(mouseX, mouseY))) {
    println("Mouse is in 2014");
    pieChart2014.mousePressed();
  }
  
  if (pieChart2015.isMouseInObject(new PVector(mouseX, mouseY))){
    println("Mouse is in 2015");
    pieChart2015.mousePressed();
  }
  
  
}
