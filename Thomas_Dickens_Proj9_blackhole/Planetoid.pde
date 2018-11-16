class Planetoid {
// this class is to be used as a base class for other planets that will be thrown into the blackhole
  float mass;
  float radius;
  float offset;
  float angle = 0;
  PShape globe;
  boolean dead = false;
  
  // base constructor
  public Planetoid(){
  }
  
  //overloaded
  public Planetoid(float mass, float radius, float offset){
   this.mass = mass;
   this.radius = radius;
   this.offset = offset;
   
   // make the planet
   //this.creation();
  }
  
  
  //methods
  
  void creation(){
    if (!this.dead){
   fill(127, 127, 127);
   noStroke();
   lights();
   translate(-width/4 + offset + this.angle, -height/4 + offset +this.angle, 0);
   globe = createShape(SPHERE, this.radius);
   shape(globe);
   this.fall();
  }
  }
  
  void fall(){
    this.angle+=mass/1000;
    this.mass++;
    println(this.angle);
    
    if (this.angle > 150){
     killPlanet();
    }
  }
  
  void killPlanet(){
    this.dead = true;
  }
  
  
  
  
}
