import processing.core.*;
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException;


public class BlackHoleSimulation extends PApplet{
	
	PImage eh;
	PImage earthTex;
	PImage moonTex;
	PImage planTex;
	BlackHole superMassive;
	Planetoid inTheBeginning;
	Earth earthTest;
	FastBody[] fastArray = new FastBody[10];
	ArrayList planets; 

	public static void main(String[] passedArgs) {
//		PApplet.main("BlackHoleSimulation");
		String[] appletArgs = new String[] { "BlackHoleSimulation" };
	    if (passedArgs != null) {
	      PApplet.main(concat(appletArgs, passedArgs));
	    } else {
	      PApplet.main(appletArgs);
	    }

	}
	
	public void settings() {
		size(926, 741, P3D);
	}
	
	public void setup() {

		 
		 //textures
		  //background
		 eh = loadImage("data/eventHorizon2.jpg");
		 earthTex = loadImage("earth.jpeg");
		 moonTex = loadImage("moon.jpeg");
		 planTex = loadImage("planet.png");
		 
		 planets = new ArrayList();
		 
		 //obejects
		 superMassive = new BlackHole(this, 100, 25);
		  //public Planetoid(float mass, float radius, float offset){
		 //inTheBeginning = new Planetoid(50, 50, 50);
		 earthTest = new Earth(this, superMassive, 60, 60, 60);
		 earthTest.spawnMoon();
		 
		 for (int i = 0; i < fastArray.length; i++){
		   fastArray[i] = new FastBody(this, superMassive, random(15), random(5), random(5));
		   
		 }
		 
		 inTheBeginning = new Planetoid(this, superMassive, 60, 30, 30);
		
	}
	
	public void draw() {
		 background(eh);
		 superMassive.collapse();

		    
		 for (int i = 0; i < fastArray.length; i++){
		   fastArray[i].genShape();
		   fastArray[i].pastEventHorizon();   
		}

		 
		 // rotation for any Planetoid objects
		 translate(width/2, height/2, 0);
		 rotateZ(frameCount*0.02f);

		   //inTheBeginning.creation();
		   earthTest.creation(earthTex);
		   earthTest.moon.creation(moonTex);
		   earthTest.fall();
		   earthTest.moon.fall();

		  for (int i = planets.size()-1; i >= 0; i--){
		    Planetoid a = (Planetoid) planets.get(i);
		    a.creation(planTex);
		    a.fall();
		  }
		  
		  if (frameCount % 100 == 0) {
			  earthTest.tearPlanet();
			  earthTest.moon.tearPlanet();
		  }
	}
	
	public void mouseClicked(){
		  planets.add(new Planetoid(this, superMassive, 60, 30, 30));
		}
	


}
