class DataImport{
  Table weatherData;
  String[] dttm;
  int[] meanTemp;
  int[] minTemp;
  int[] maxTemp;
  int[] avgMinTemp;
  int[] avgMaxTemp;
  int[] recMinTemp;
  int[] recMaxTemp;
  int[] recMinTempYr;
  int[] recMaxTempYr;
  float[] precip;
  float[] avgPrecip;
  float[] recPrecip;
  
  public DataImport(){
  }
  
  public DataImport(String  fileName){
    this.weatherData = loadTable(fileName, "header");
    this.dttm = new String[this.weatherData.getRowCount()];
    this.meanTemp = new int[this.weatherData.getRowCount()];
    this.minTemp = new int[this.weatherData.getRowCount()];
    this.maxTemp = new int[this.weatherData.getRowCount()];
    this.avgMinTemp = new int[this.weatherData.getRowCount()];
    this.avgMaxTemp = new int[this.weatherData.getRowCount()];
    this.recMinTemp = new int[this.weatherData.getRowCount()];
    this.recMaxTemp = new int[this.weatherData.getRowCount()];
    this.recMinTempYr = new int[this.weatherData.getRowCount()];
    this.recMaxTempYr = new int[this.weatherData.getRowCount()];
    this.precip = new float[this.weatherData.getRowCount()];
    this.avgPrecip = new float[this.weatherData.getRowCount()];
    this.recPrecip = new float[this.weatherData.getRowCount()];
  
    weatherData = loadTable(fileName, "header");
  
    for(int i=0; i < weatherData.getRowCount(); i++){
      TableRow row = weatherData.getRow(i);
      
      String dtime = row.getString("date");
      int meanT = row.getInt("actual_mean_temp");
      int minT = row.getInt("actual_min_temp");
      int maxT = row.getInt("actual_max_temp");
      int aMinT = row.getInt("average_min_temp");
      int aMaxT = row.getInt("average_max_temp");
      int rMinT = row.getInt("record_min_temp");
      int rMaxT = row.getInt("record_max_temp");
      int rMinTYr = row.getInt("record_min_temp_year");
      int rMaxTYr = row.getInt("record_max_temp_year");
      float prec = row.getFloat("actual_precipitation");
      float aPrec = row.getFloat("average_precipitation");
      float rPrec = row.getFloat("record_precipitation");
      
      dttm[i] = dtime;
      meanTemp[i] = meanT;
      minTemp[i] = minT;
      maxTemp[i] = maxT;
      avgMinTemp[i] = aMinT;
      avgMaxTemp[i] = aMaxT;
      recMinTemp[i] = rMinT;
      recMaxTemp[i] = rMaxT;
      recMinTempYr[i] = rMinTYr;
      recMaxTempYr[i] = rMaxTYr;
      precip[i] = prec;
      avgPrecip[i] = aPrec;
      recPrecip[i] = rPrec;

    }
  }
}
