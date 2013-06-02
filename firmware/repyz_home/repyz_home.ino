// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo;  
 
void setup() 
{ 
  myservo.attach(8);
} 
 
 
void loop() 
{ 
                        
  myservo.write(0  +90);               

} 
