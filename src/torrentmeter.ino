/*
 * TorrentMeter driver for Arduino
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) 2010, Thorsten Haas <github@skytee.com>
*/
 
static int meter = 9;		// pwm output pin
static int excessled = 13;	// led on: input value is beyond scale limit
static int bufsiz = 8;
static int keythen = 21;	// key used to look up pwm value from table
static int pwmthen = 0;		// pwm value (then and now)

// pwm lookup tables    0  5    10   15   20   25   30   35   40   45   50   55   60   65   70   75   80   85   90   95   100  
static int rising[]  = {0, 115, 135, 149, 160, 169, 175, 182, 186, 192, 196, 202, 207, 213, 218, 225, 230, 236, 240, 246, 249};
static int falling[] = {0, 113, 132, 145, 157, 164, 171, 177, 182, 187, 192, 197, 203, 209, 214, 219, 224, 229, 235, 242, 249};
static int risingcal = +0;

void setup() {
	TCCR1B = TCCR1B & 0b11111001;	// set pwm frequency (Atmega 328)
	pinMode(excessled, OUTPUT);
	digitalWrite(excessled, LOW);
	Serial.begin(9600);
	setmeter(100);
	delay(500);
	setmeter(0);
}

void loop()	{
	setmeter(serialreadvalue());
}

void analogInvWrite(int pin, int val) {
	analogWrite(pin, 255-val);
}

void setmeter(int value) {
	int keynow = 0,	// current key used to look up pwm value
		pwmnow,		// current pwm value
		i;
	
	// uncomment this if you need to input pwm values, e.g. for calibration.
	//analogWrite(meter, 255-value);
	//return;

	// compute key for pwm lookup table.
	keynow = value / 5;		// 20 steps and 0
	if ((value % 5) > 2)	// use key N5 for [3..7] and N0 for [8..2]
		keynow++;
	if (keynow >= 20) {
		keynow = 20;
		digitalWrite(excessled, HIGH);
	} else {
		digitalWrite(excessled, LOW);
	}
			 
	if (keynow > keythen) {
		for (i = keythen+1; i <= keynow; i++) {
			analogInvWrite(meter, pwmnow = rising[i] + risingcal);
			if (i < keynow) delay(140);
		}
	} else if (keynow < keythen) {
		for (i = keythen-1; i >= keynow; i--) {
			analogInvWrite(meter, pwmnow = falling[i]);
			if (i > keynow) delay(140);
		}
	} else {
		pwmnow = pwmthen;
	}
 
	keythen = keynow;
	pwmthen = pwmnow;
}

int serialreadvalue() {
	char buf[bufsiz];
	buf[0] = '\0';
	for (int i = 0; ; ) {
		if (Serial.available() <= 0) {
			delayMicroseconds(521);
		} else {
			buf[i] = Serial.read();
			if (buf[i] == '\r' || buf[i] == '\n' || buf[i] == '\0') {
				buf[i] = '\0';
				break;
			}
			(i < bufsiz-1) ? i++ : 0;
		}
	}
	return(atoi(buf));
}
