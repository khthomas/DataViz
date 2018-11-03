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
PieChartView testInts;

void setup(){
  background(255);
  size(800, 800);

  // Import CSV Data
  dataImport = new DataImport(csvName);

  // Histogram of Summer temperatures
  // HistogramView(DataImport data)
  weatherHist = new HistogramView(dataImport);

  // Line Graph showing mean temperature
  // LineGraphView(DataImport input, float xStart, float yStart, float scaleVal)
  weatherLine = new LineGraphView(dataImport, 10, 300, width/dataImport.meanTemp.length);
  
  // Composite Bar Graph Showing min and Max temperatures every two weeks.
  // BarGraphView(DataImport barData);
  weatherBar = new BarGraphView(dataImport);
  
  // Bar chart of average temperature
  // BarChartAvgTemps(DataImport dataObject)
  avgTemps = new BarChartAvgTemps(dataImport);
  avgTemps.drawGraph(10, 125, width / avgTemps.avgVals.length);

  // PieChart
  pieChart2014 = new PieChartView(dataImport.avgPrecip, dataImport.dttm, 2015);
  pieChart2014.drawPie(150,200,200, "Average Precipitation in 2015");


  pieChart2015 = new PieChartView(dataImport.avgPrecip, dataImport.dttm, 2014);
  pieChart2015.drawPie(500, 200, 200, "Average Precipitation in 2014");

  // test of an integer array, the output can't really be interpreted, but the graph works, the idea is that the class is genearlized. 
  //testInts = new PieChartView(dataImport.avgMinTemp, dataImport.dttm, 2015);
  //testInts.drawPie(400,100,200);
 
}
