
#include <Servo.h> 
 
Servo s;  
 
void setup() 
{ 
  s.attach(8);
} 
 
 
void loop() 
{ 
                        
  s.write(0  +90);               

} 
