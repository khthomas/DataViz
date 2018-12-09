import java.util.ArrayList;

import processing.core.*;

public class Planetoid {

	// this class is to be used as a base class for other planets that will be thrown into the blackhole
	  float mass;
	  float radius;
	  float offset;
	  float angle = 0;
	  PShape globe;
	  boolean dead = false;
	  float baseMass;
	  PApplet p;
	  BlackHole b;
	  int numberOfPieces = 0;
	  ArrayList subPlanets = new ArrayList();
	  PImage globeTex;
	  
	  // base constructor
	  public Planetoid(){
	  }
	  
	  //overloaded
	  public Planetoid(PApplet p, BlackHole b, float mass, float radius, float offset){
	   this.mass = mass;
	   this.baseMass = mass;
	   this.radius = radius;
	   this.offset = offset;
	   this.p = p;
	   this.b = b;
	   
	   // make the planet
	   //this.creation();
	  }
	  
	  
	  //methods
	  
	  public void creation(){
	    if (!this.dead){
	   p.fill(127, 255, 127);
	   p.noStroke();
	   p.lights();
	   p.translate(-p.width/4 + this.offset + this.angle, -p.height/4 + this.offset +this.angle, 0);
	   globe = p.createShape(p.SPHERE, this.radius);
	   globe.setTexture(globeTex);
	   p.shape(globe);
	   //this.fall();
	    }
	  }
	  
	  
	  // overloaded creation which applies a texture to the planetoid
	    public void creation(PImage globeTex){
	      p.fill(127, 127, 127);
	      p.noStroke();
	      p.lights();
	      this.globeTex = globeTex;
	      globe = p.createShape(p.SPHERE, this.radius);
	      globe.setTexture(globeTex);

	     
	     if (!this.dead){
	     //fill(127, 127, 127);
	     //noStroke();
	     //lights();
	     p.pushMatrix();
	     p.translate(-p.width/4 + offset + this.angle, -p.height/4 + offset +this.angle, 0);
	     //globe = createShape(SPHERE, this.radius);
	     //globe.setTexture(globeTex);
	     p.shape(globe);
	     p.popMatrix();
	     //this.fall();
	      }
	    }

	  
	  public void fall(){
	    
	    if (!this.dead){
	    this.angle+=mass/1000;
	    this.mass++;
	    
	    if (this.angle > 150){
	     this.shrinkPlanet();
	    }
	    
	    if (this.angle > 155) { //this.angle > 155
	      this.killPlanet();
	      increaseBlackHoleMass();
	      }
	    }
	  }
	  
	  
	  public void shrinkPlanet(){
	    for (int i = 0; i < 1000; i++){
	     float dec = this.radius / 1000;
	     this.radius -= dec; 
	    }
	  }
	  
	  
	  
	  public void killPlanet(){
	    this.dead=true;
	  }
	  
	  
	 
	  public void increaseBlackHoleMass(){
	    b.setMass(this.baseMass);
	    
	  }
	  
	  public void setMass(float mass) {
		  this.mass = mass;
	  }
	  
	  public void setRadius(float radius) {
		  this.radius = radius;
	  }
	  
	  public void setOffset(float offset) {
		  this.offset = offset;
	  }
	  
	  public void setBaseMass(float baseMass) {
		  this.baseMass = baseMass;
	  }
	  
	  void tearPlanet(int frameCountVar, double shrinkFactor) {
		  
		  float newMass;
		  float newRadius;
		 
		  if (p.frameCount % frameCountVar == 0 && subPlanets.size() < 2) {
		  newMass = (float) (this.baseMass * shrinkFactor);// (numberOfPieces - current));
		  this.mass = newMass;
		  
		  newRadius = (float) (this.radius * shrinkFactor); //(numberOfPieces - current);
		  this.radius = newRadius;
		  

		  
		 
//		  public Planetoid(PApplet p, BlackHole b, float mass, float radius, float offset){
		 subPlanets.add(new Planetoid(p,b, newMass, newRadius, 0));		 
		  }  else {
			  newMass = this.mass;
			  newRadius = this.radius;
		  }
		  
		  
		 for (int planet = 0; planet < subPlanets.size(); planet++) {
			    Planetoid a = (Planetoid) subPlanets.get(planet);
			    a.creation(this.globeTex);
			    a.fall();
			    a.setMass(newMass);
			    a.setRadius(newRadius);
			    a.setBaseMass(this.baseMass / subPlanets.size());
			    // the next line isn't quite what I was looking for, but I like the effect
			    // its like the closer it gets to the event horizon, the more unstable it becomes.
			    a.setOffset(this.offset + (newRadius*subPlanets.size()) + p.random(25));
			    
		 }
		 
		 p.println(this.baseMass);
		 
	  } //end tear planet
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
