class WeatherReport{
  
  // Fields
  String city;
  String state;
  String[] desc;
  float[] temp;
  float[] hum;
  float[] press;
  PImage cloudy;
  PImage rainy;
  PImage sunny;
  int tSize;
  int tFill;
  int count;

  //Constructors
  public WeatherReport(String[] desc, float[] temp, float[] hum, float[] press, int count){
    this.desc = desc;
    this.count = count;
    this.cloudy = loadImage("Clouds.jpg");;
    this.rainy = loadImage("Rain.jpg");
    this.sunny = loadImage("sun.jpg");
    this.city = city;
    this.state = state;
    this.tSize = tSize;
    this.tFill = tFill;
    this.count = count;
    
    city = "Richmond";
    state = "VA";
    tSize = 48;
    tFill = 0;
    
    fill(255, 150);
    rect(-1,-1, width, height);
    
    if(desc[count].equals("Clouds") ==true){
    tint(255, 128);
    image(cloudy, 0, 0);
    }
   
    if(desc[count].equals("Rain")==true){
    tint(255, 128);
    image(rainy, 0, 0);
    }
       
    if(desc[count].equals("Clear")==true){
    tint(255, 128);
    image(sunny, height/8, height/20);
    }
  
    //Print Labels onscreen
    textSize(tSize);
    textAlign(CENTER);
    fill(tFill);
    text(city+", "+ state, width/2, height/2-32);
   
    textSize(tSize/2);
    textAlign(CENTER);
    fill(tFill);
    text("The temperature is: "+temp[count]+"°F.", width/2, height/2);
   
    textSize(tSize/2);
    textAlign(CENTER);
    fill(tFill);
    text("Weather Description: "+desc[count], width/2, height/2 + tSize/2);
    
    textSize(tSize/2);
    textAlign(CENTER);
    fill(tFill);
    text("The Humidity is: "+hum[count]+"%", width/2, height/2 + tSize);
    
    textSize(tSize/2);
    textAlign(CENTER);
    fill(tFill);
    text("The Pressure is: "+press[count], width/2, height/2 + tSize*1.5);
  }
}
