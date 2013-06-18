/*
  EEPROM512.pde
  AT24C512C EEPROM Benchmark Sketch 
  
  Find on GitHub:
  https://github.com/husio-org/AT24C512C
  
  The Atmel¨ AT24C512C provides 524,288 bits of Serial Electrically Erasable and
  Programmable Read-Only Memory (EEPROM) organized as 65,536 words of eight bits
  each. The cascadable feature of the device allows up to eight devices to share a
  common 2-wire bus. The device is optimized for use in many industrial and commercial
  applications where low-power and low-voltage operation are essential. The devices are
  available in space-saving 8-lead JEDEC SOIC, 8-lead EIAJ SOIC, 8-lead TSSOP,
  8-pad UDFN, 8-ball WLCSP, and 8-ball VFBGA packages. In addition, the entire family
  is available in 1.7V (1.7V to 3.6V) and 2.5V (2.5V to 5.5V) versions.
  
  http://www.atmel.com/Images/Atmel-8720-SEEPROM-AT24C512C-Datasheet.pdf

  Address Map, and Storage Capability

  Address = A2..A0 P8..P0 B6..B0

  2^3 devices = 8 devices (A bits)
  2^9 pages = 512 pages (B pits)
  2^7 bytes = 128 bytes (B bits)

  2^16 bytes per device = 64 Kbytes per device
  2^19 bytes with all 8 devices = 512Kbytes max storage capability
    
*/

#include <Wire.h>
#include <AT24C512C.h>

unsigned long time;
unsigned long finishTime;
unsigned long errors = 0;
unsigned long address = 0;
byte loop_size;

// Set to a higher number if you want to start at a higher address. 
#define MIN_ADDRESS 0

// Maximum address (inclusive) in address space.  Choose one.
// It should be: 0x000XFFFF Where X is 0-7 for 1 to 8 devices

#define MAX_ADDRESS 0x0000FFFF // 1 device


void setup()
{
  // Make sure we aren't reading old data
  randomSeed(analogRead(0));
  loop_size = random(1, 100);
  Serial.begin(9600);
  Serial.println();
  Serial.println("AT24C512C Library Benchmark Sketch");
  Serial.println();
  writeByByteTest();
  readByByteTest();
}

void loop()
{
}

void writeByByteTest()
{
  time = millis();
  errors = 0;
  Serial.println("--------------------------------");
  Serial.println("Write By Byte Test:");
  Serial.println();
  Serial.print("Writing data:");
  for (address = MIN_ADDRESS; address <= MAX_ADDRESS; address++)
  {
    EEPROM512.write(address, (uint8_t)(address % loop_size));
    if (!(address % 5000)) Serial.print(".");
  }
  finishTime = millis() - time;
  Serial.println("DONE");
  Serial.print("Total Time (seconds): "); 
  Serial.println((unsigned long)(finishTime / 1000));
  Serial.print("Write operations per second: "); 
  Serial.println((unsigned long)(MAX_ADDRESS / (finishTime / 1000))); 
  Serial.println("--------------------------------");   
  Serial.println();
}

void readByByteTest()
{
  time = millis();
  errors = 0;
  Serial.println("--------------------------------");
  Serial.println("Read By Byte Test:");
  Serial.println();
  Serial.print("Reading data:");
  for (address = MIN_ADDRESS; address <= MAX_ADDRESS; address++)
  {
    uint8_t data;
    data = EEPROM512.read(address);
    if (data != (uint8_t)(address % loop_size)) 
    {
      Serial.println();
      Serial.print("Address: ");
      Serial.print(address);
      Serial.print(" Should be: ");
      Serial.print((uint8_t)(address % loop_size), DEC);
      Serial.print(" Read val: ");
      Serial.println(data, DEC);
      errors++;
    }
    if (!(address % 5000)) Serial.print(".");
  }
  finishTime = millis() - time;
  Serial.println("DONE");
  Serial.println();
  Serial.print("Total Test Time (secs): "); 
  Serial.println((unsigned long)(finishTime / 1000));
  Serial.print("Read operations per second: "); 
  Serial.println((unsigned long)(MAX_ADDRESS / (finishTime / 1000))); 
  Serial.print("Total errors: "); 
  Serial.println(errors);   
  Serial.println("--------------------------------");
  Serial.println();
}

