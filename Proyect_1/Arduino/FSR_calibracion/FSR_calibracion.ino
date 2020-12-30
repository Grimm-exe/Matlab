int fsrPin_1 = 0; // Pin analogico 0
int fsrPin_2 = 1;
int fsrReading_1; // Realizacion del divisor de voltaje
int fsrReading_2;
int fsrVoltage; // conversion de analogico a voltaje
float F;
unsigned long fsrResistance; // Voltaje es convertido en resistencia
unsigned long fsrConductance;
long fsrForce; // Conversion de resistencia a fuerza

void setup(void) {
Serial.begin(9600); 
}

void loop(void) {
fsrReading_1 = analogRead(fsrPin_1);
fsrReading_2= analogRead(fsrPin_2);
F=(fsrReading_1+fsrReading_2)/2;

Serial.println(fsrReading_1);
Serial.println(fsrReading_2);
Serial.println(F);


delay(500);
}
