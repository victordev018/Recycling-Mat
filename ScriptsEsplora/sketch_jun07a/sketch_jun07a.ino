#include<Esplora.h>

void setup() {
  Serial.begin(9600);
}

void loop() {
  int eixoX = Esplora.readAccelerometer(X_AXIS);
  Serial.print(eixoX*-1);
  Serial.println("]");
  delay(500);
  if ((eixoX *-1) >= 60){
    Esplora.writeRGB(0, 255, 0);
  }

  if ((eixoX * -1) > -70 && (eixoX * -1) < 60){
    Esplora.writeRGB(0, 0, 0);  
  }

  if ((eixoX * -1) <= -70){
    Esplora.writeRGB(255, 0, 0);  
  }
  
//  Esplora.writeRGB(0,0,0);
//  
//
//  // caso clique no botão direito do switch
//  if (Esplora.readButton(SWITCH_RIGHT) == LOW){
//    Esplora.writeRGB(0, 255, 0);
//    delay(200);
//    Serial.println("Ligou");
//  }
//
//  if (Serial.read() == 'D'){
//    Esplora.writeRGB(0, 0, 0);
//    Serial.println("desligou");  
//  }

  
}
