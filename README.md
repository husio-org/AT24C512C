  AT24C512C_h.h
  AT24C512C Library for Arduino
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  US

  This library is based on several projects:

  AT24C1024 EEPROM library for the Arduino found here:
  https://code.google.com/p/arduino-at24c1024/
 
  The Arduino EEPROM library found here:  
  http://arduino.cc/en/Reference/EEPROM

  The 24C256 library found here:
  http://www.arduino.cc/playground/Code/I2CEEPROM

  The 24C512 library found here:
  http://www.arduino.cc/playground/Code/I2CEEPROM24LC512

  Our project page is here:
  http://www.arduino.cc/playground/Code/I2CEEPROM24C1024
  
  From the datasheet:

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
  2^9 pages = 512 pages (P bits)
  2^7 bytes = 128 bytes (B bits)

  2^16 bytes per device = 64 Kbytes per device
  2^19 bytes with all 8 devices = 512Kbytes max storage capability
  
