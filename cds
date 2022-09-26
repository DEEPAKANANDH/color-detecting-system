#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27,16,2);

// set the LCD number of columns and rows

int lcdColumns = 16;

int lcdRows = 2;

const int s0 = D3;  

const int s1 = D4;  

const int s2 = D5;  

const int s3 = D6;  

const int out = D7;   

int red = 0;  

int green = 0;  

int blue = 0; 


int redcolor= 0;

int greencolor= 0;

int bluecolor= 0;

int yellowcolor= 0;

int pinkcolor=0;

int whitecolor=0;

int blackcolor=0;

int color= 0;



void setup()   

{  

  Serial.begin(9600); 

  lcd.init();

  lcd.backlight();

  lcd.setCursor(0, 0);

    lcd.print("ESP Color Finder");

  pinMode(s0, OUTPUT);  

  pinMode(s1, OUTPUT);  

  pinMode(s2, OUTPUT);  

  pinMode(s3, OUTPUT);  

  pinMode(out, INPUT);  

  digitalWrite(s0, HIGH);  

  digitalWrite(s1, HIGH);  


}  

void loop() 

{  


  digitalWrite(s2, LOW);  

  digitalWrite(s3, LOW);  

  //count OUT, pRed, RED  

  red = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);  

  digitalWrite(s3, HIGH);  

  //count OUT, pBLUE, BLUE  

  blue = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);  

  digitalWrite(s2, HIGH);  

  //count OUT, pGreen, GREEN  

  green = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH); 

  Serial.print("R Intensity:");  

  Serial.print(red, DEC);  

  Serial.print(" G Intensity: ");  

  Serial.print(green, DEC);  

  Serial.print(" B Intensity : ");  

  Serial.print(blue, DEC);  

  if(red<12 & red>9 & green<44 & green>41 & blue<31 & blue>28){

    delay(250);

    redcolor++;

    Serial.print("Red");

    lcd.setCursor(0, 1);

    lcd.print("     Red       ");

    delay(2000);

    lcd.clear();


  }

  if(red<37 & red>34 & green<31 & green>28 & blue<17 &blue>14){

    delay(250);

    bluecolor++;

    Serial.print("Blue");

    lcd.setCursor(0, 1);

    lcd.print("    Blue      ");

    delay(2000);

    lcd.clear();


  }
  if(red<71 & red>68 & green<102 & green>99 & blue<85 &blue>82){

    delay(250);

    blackcolor++;n 

    Serial.print("Black ");

    lcd.setCursor(0, 1);

    lcd.print("    Black    ");

    delay(2000);

    lcd.clear();


  }
  
  if(red<11 & red>8 & green<12 & green>9 & blue<12 &blue>9){

    delay(250);

    whitecolor++;

    Serial.print("white");

    lcd.setCursor(0, 1);

    lcd.print("    white    ");

    delay(2000);

    lcd.clear();


  }
  if(red<7 & red>4 & green<31 & green>28 & blue<15 & blue>12){

    delay(250);

    pinkcolor++;

    Serial.print("pink");

    lcd.setCursor(0, 1);

    lcd.print("     pink      ");

    delay(2000);

    lcd.clear();


  }

  if(red<20 & red>17 & green<13 & green>10 & blue<22 & blue>19){

    delay(250);

    greencolor++;

    Serial.print("Green");

    lcd.setCursor(0, 1);

    lcd.print("     Green      ");

    delay(2000);

    lcd.clear();


  }

  if(red<7 & red>4 & green<31 & green>28 & blue<15 & blue>12){

    delay(250);

    yellowcolor++;

    Serial.print("Yellow");

    lcd.setCursor(0, 1);

    lcd.print("     Yellow     ");

    delay(50);

    lcd.clear();


  } 

   

   Serial.println();  

  //delay(5000); 

}
