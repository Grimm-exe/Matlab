#include <math.h>
int fsrPin = 0; // Pin analogico 0
int fsrReading; // Realizacion del divisor de voltaje
int fsrVoltage; // conversion de analogico a voltaje
double a=1884343.554;
double b=-0.9585;
double ecuacion_1;
double Fuerza_R;
unsigned long fsrResistance; // Voltaje es convertido en resistencia
unsigned long fsrConductance;
long fsrForce; // Conversion de resistencia a fuerza

void setup(void) {
Serial.begin(9600); 
}

void loop(void) {
fsrReading = analogRead(fsrPin);
//Serial.print("Analog reading = ");
//Serial.println(fsrReading);

//  0V to 5V (= 5000mV)
fsrVoltage = map(fsrReading, 0, 1023, 0, 5000);
//Serial.print("Voltage reading in mV = ");
//Serial.println(fsrVoltage);

if (fsrVoltage == 0) {
//Serial.println("No pressure");
} else {
// The voltage = Vcc * R / (R + FSR) where R = 10K and Vcc = 5V
// so FSR = ((Vcc - V) * R) / V yay math!
fsrResistance = 5000 - fsrVoltage; // fsrVoltage is in millivolts so 5V = 5000mV
fsrResistance *= 10000; // 10K resistor
fsrResistance /= fsrVoltage;
Serial.print("FSR  ohms = ");
Serial.println(fsrResistance);
ecuacion_1=(log(fsrResistance/a))/b;
Fuerza_R=exp(ecuacion_1);
Serial.println(Fuerza_R);
}
delay(1000);}
