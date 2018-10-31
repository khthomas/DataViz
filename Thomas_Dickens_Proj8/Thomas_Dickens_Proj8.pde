import java.text.DecimalFormat;
DecimalFormat df = new DecimalFormat("###.##");
String csvName = "KCLT.csv";
DataImport dataImport;
HistogramView weatherHist;
LineGraphView weatherLine;
BarGraphView weatherBar;
BarChartAvgTemps avgTemps;
PieChartView pieChart;

void setup(){
  background(255);
  size(800, 800);

  dataImport = new DataImport(csvName);

//  weatherHist = new HistogramView(dataImport);


// LineGraphView(DataImport input, float xStart, float yStart, float scaleVal)
// weatherLine = new LineGraphView(dataImport, 10, 100, width/dataImport.meanTemp.length);
  weatherBar = new BarGraphView(dataImport);
  
// Bar chart of average temperature
// BarChartAvgTemps(DataImport dataObject)
avgTemps = new BarChartAvgTemps(dataImport);
avgTemps.drawGraph(10, 125, width / avgTemps.avgVals.length);

// PieChart
pieChart = new PieChartView(dataImport.avgPrecip, dataImport.dttm, 2015);
println(pieChart.pieValues);
 
}
