
import android.os.Bundle;
import android.content.Intent;

import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;

import ketai.sensors.*;

KetaiSensor sensor;
PVector accelerometer;
float light, proximity;
KetaiLocation location;
double longitude, latitude, altitude;

KetaiList connectionList;
String info = "";
boolean isConfiguring = true;
String UIText;

ArrayList<String> devices = new ArrayList<String>();
boolean isWatching = false;

String[] alerta = {"", "", ""};
int currentEvent = -1;

void setup() {
  orientation(PORTRAIT);
  stroke(255);
    
  sensor = new KetaiSensor(this);
  sensor.start();
  sensor.list();
  accelerometer = new PVector();
  location = new KetaiLocation(this);

  textFont(createFont("FontsFree-Net-Proxima-Nova-Bold.otf", 64));
}

void draw() {
  background(201, 223, 236);

  int tSize = 128;
  textAlign(CENTER);
  textSize(tSize);
  while(textWidth(alerta[0]) > width*0.8
    || textWidth(alerta[1]) > width*0.8
    || textWidth(alerta[2]) > width*0.8){
    tSize--;
    textSize(tSize);
  }
  fill(38, 174, 232);
  text(alerta[0], width/2, (height+tSize)/2 - (tSize*2/3 + 4));
  fill(35, 67, 150);
  text(alerta[1], width/2, (height+tSize)/2);
  fill(34, 34, 34);
  text(alerta[2], width/2, (height+tSize)/2 + (tSize*2/3 + 4));
}
