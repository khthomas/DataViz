String csvName = "KCLT.csv";
DataImport dataImport;
HistogramView weatherHist;
LineGraphView weatherLine;
BarGraphView weatherBar;

void setup(){
  background(255);
  size(800, 800);

  dataImport = new DataImport(csvName);
//  weatherHist = new HistogramView(dataImport);


  // LineGraphView(DataImport input, float xStart, float yStart, float scaleVal)
  weatherLine = new LineGraphView(dataImport, 10, 100, width/dataImport.meanTemp.length);

}
