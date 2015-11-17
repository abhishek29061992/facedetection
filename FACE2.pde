import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage[] happy;
int fac=3;

void setup() {
  size(1024,786);
  video = new Capture(this, 640/2, 480/2); 
  opencv = new OpenCV(this, 640/2, 480/2);
  happy = new PImage[10];
  happy[2]= loadImage("ravan.png");
  happy[0]= loadImage("happy_diwali2.png");
  happy[1]= loadImage("happy_diwali3.png");
  happy[3]= loadImage("dia.png");
  happy[4]= loadImage("gulj.png");  
  happy[5]= loadImage("laddu.png");
  happy[6]= loadImage("jalebi.png");
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  video.start();
}

void draw() {
  scale(fac);
  opencv.loadImage(video);
  image(video, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {    
    if(i==2)
    image(happy[i],faces[i].x-2*faces[i].width,faces[i].y,faces[i].width*5, faces[i].height);
    else
    if(i<2)
    image(happy[i],faces[i].x-faces[i].width/2,faces[i].y-faces[i].height,faces[i].width*2, faces[i].height);
    else if(i>2)
    image(happy[i],faces[i].x,faces[i].y,faces[i].width, faces[i].height); 
    println(faces[i].x + "," + faces[i].y);
  }
}

void captureEvent(Capture c) {
  c.read();
}