void onAccelerometerEvent(float x, float y, float z){
  accelerometer.set(x, y, z);
  testSensorEvent();
}
 
void onLightEvent(float v){
  light = v;
  testSensorEvent();
}

void onProximityEvent(float v) {
  proximity = v;
  testSensorEvent();
 }
 
void onLocationEvent(double _latitude, double _longitude, double _altitude) {
  longitude = _longitude;
  latitude = _latitude;
  altitude = _altitude;
  testSensorEvent();
}
 
void eventInTheCar(int event){
  switch(event){ 
    case Eventos.PROXIMITY_EVENT:
      alerta[0] = "POSIBLE";
      alerta[1] = "INTRUSO";
      alerta[2] = "HUSMEANDO";
      break;
    case Eventos.TOUCH_EVENT:
      alerta[0] = "ALGUIEN INTENTA";
      alerta[1] = "ABRIR O HA ROTO";
      alerta[2] = "LOS CRISTALES";
      break;
    case Eventos.CAR_DISTURBANCE_EVENT:
      alerta[0] = "PROBABLE IMPACTO";
      alerta[1] = "O ROBO DE";
      alerta[2] = "AUTOPARTES EXTERNAS";
      break;
    case Eventos.INTRUDER_EVENT:
      alerta[0] = "INTRUSO";
      alerta[1] = "EN EL";
      alerta[2] = "AUTO";
      break;
    case Eventos.GPS_EVENT:
      alerta[0] = "EL AUTOMOVIL";
      alerta[1] = "ESTA EN MOVIMIENTO.";
      alerta[2] = "POSIBLE ROBO";
      break;
    default:
      alerta[0] = "";
      alerta[1] = "";
      alerta[2] = "";
  }
  if(currentEvent != event && event >= 0 & event <=4){
    honk.play();
  }
  currentEvent = event;
}
 
class Eventos{
  static final int PROXIMITY_EVENT = 0;
  static final int TOUCH_EVENT = 1;
  static final int CAR_DISTURBANCE_EVENT = 2;
  static final int INTRUDER_EVENT = 3;
  static final int GPS_EVENT = 4;
}
 
 
void testSensorEvent(){
  if (touchIsStarted){
    eventInTheCar(Eventos.TOUCH_EVENT);
  } else if(accelerometer.x > 3.00 && accelerometer.z > 2.00){
    eventInTheCar(Eventos.CAR_DISTURBANCE_EVENT);
  } else if (light > 500){
    eventInTheCar(Eventos.INTRUDER_EVENT);
  } else if(proximity <= 4){
    eventInTheCar(Eventos.PROXIMITY_EVENT);
  } else if(latitude != 0 && longitude != 0 && altitude!=0 && accelerometer.x > 3.00 && accelerometer.z > 2.00){
    eventInTheCar(Eventos.GPS_EVENT);
  } else {
    eventInTheCar(-1);
  }
}
