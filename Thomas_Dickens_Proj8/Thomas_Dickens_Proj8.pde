String csvName = "KCLT.csv";
DataImport dataImport;

void setup(){
dataImport = new DataImport(csvName);
println(dataImport.minTemp);      

}
