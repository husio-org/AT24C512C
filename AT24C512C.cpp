#include "AT24C512C.h"


AT24C512C::AT24C512C(void)
{
   Wire.begin();
}

void AT24C512C::write(unsigned long dataAddress, uint8_t data)
{
   Wire.beginTransmission((uint8_t)((0x500000 | dataAddress) >> 16)); // B1010xxx
   Wire.write((uint8_t)((dataAddress & WORD_MASK) >> 8)); // MSB
   Wire.write((uint8_t)(dataAddress & 0xFF)); // LSB
   Wire.write(data);
   Wire.endTransmission();
   delay(5);
}

uint8_t AT24C512C::read(unsigned long dataAddress)
{
   uint8_t data = 0x00;
   Wire.beginTransmission((uint8_t)((0x500000 | dataAddress) >> 16)); // B1010xxx
   Wire.write((uint8_t)((dataAddress & WORD_MASK) >> 8)); // MSB
   Wire.write((uint8_t)(dataAddress & 0xFF)); // LSB
   Wire.endTransmission();
   Wire.requestFrom(0x50 | (dataAddress >> 16), 1);
   if (Wire.available()) data = Wire.read();
   return data;
}

AT24C512C EEPROM512;
