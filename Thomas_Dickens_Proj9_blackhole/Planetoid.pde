class Planetoid {
// this class is to be used as a base class for other planets that will be thrown into the blackhole
  float mass;
  float radius;
  float offset;
  float angle = 0;
  PShape globe;
  boolean dead = false;
  float baseMass;
  
  // base constructor
  public Planetoid(){
  }
  
  //overloaded
  public Planetoid(float mass, float radius, float offset){
   this.mass = mass;
   this.baseMass = mass;
   this.radius = radius;
   this.offset = offset;
   
   // make the planet
   //this.creation();
  }
  
  
  //methods
  
  void creation(){
    if (!this.dead){
   fill(127, 255, 127);
   noStroke();
   lights();
   translate(-width/4 + this.offset + this.angle, -height/4 + this.offset +this.angle, 0);
   globe = createShape(SPHERE, this.radius);
   shape(globe);
   //this.fall();
    }
  }
  
  
  // overloaded creation which applies a texture to the planetoid
    void creation(PImage globeTex){
      fill(127, 127, 127);
      noStroke();
      lights();
      globe = createShape(SPHERE, this.radius);
      globe.setTexture(globeTex);

     
     if (!this.dead){
     //fill(127, 127, 127);
     //noStroke();
     //lights();
     pushMatrix();
     translate(-width/4 + offset + this.angle, -height/4 + offset +this.angle, 0);
     //globe = createShape(SPHERE, this.radius);
     //globe.setTexture(globeTex);
     shape(globe);
     popMatrix();
     //this.fall();
      }
    }

  
  void fall(){
    
    if (!this.dead){
    this.angle+=mass/1000;
    this.mass++;
    
    if (this.angle > 150){
     this.shrinkPlanet();
    }
    
    if (this.angle > 155) {
      this.killPlanet();
      increaseBlackHoleMass();
      }
    }
  }
  
  
  void shrinkPlanet(){
    for (int i = 0; i < 1000; i++){
     float dec = this.radius / 1000;
     this.radius -= dec; 
    }
  }
  
  
  
  void killPlanet(){
    this.dead=true;
  }
  
  
 
  void increaseBlackHoleMass(){
    superMassive.setMass(this.baseMass);
    
  }
  
  
  
  
}
