#include <Adafruit_PWMServoDriver.h>
void parse_variables(String myString);
void reset_all_PCA_pins();

void var1_attract(int max_attract);
void var2_attract(int max_attract);
void var2_repel(int max_repel);
void var3_repel(int max_repel);
void var4_repel(int max_repel);
void var5_repel(int max_repel);
void var6_repel(int max_repel);
void var11_attract(int max_attract);
void var12_attract(int max_attract);
void var12_repel(int max_repel);
void var13_repel(int max_repel);
void var14_repel(int max_repel);
void var15_repel(int max_repel);
void var16_repel(int max_repel);

void var1_reset();
void var2_reset();
void var3_reset();
void var4_reset();
void var5_reset();
void var6_reset();
void var11_reset();
void var12_reset();
void var13_reset();
void var14_reset();
void var15_reset();
void var16_reset();

Adafruit_PWMServoDriver pwm_40 = Adafruit_PWMServoDriver(0x40);
Adafruit_PWMServoDriver pwm_41 = Adafruit_PWMServoDriver(0x41);
Adafruit_PWMServoDriver pwm_42 = Adafruit_PWMServoDriver(0x42);
Adafruit_PWMServoDriver pwm_43 = Adafruit_PWMServoDriver(0x43);
Adafruit_PWMServoDriver pwm_44 = Adafruit_PWMServoDriver(0x44);
Adafruit_PWMServoDriver pwm_45 = Adafruit_PWMServoDriver(0x45);
Adafruit_PWMServoDriver pwm_60 = Adafruit_PWMServoDriver(0x60);
Adafruit_PWMServoDriver pwm_61 = Adafruit_PWMServoDriver(0x61);

struct coil
{
  int pwm;
  int dir;
  int ste;
} var1, var2, var3, var4, var5, var6, var11, var12, var13, var14, var15, var16;

int loop_to_run = 99;

int max_attract = 800;
int max_repel = 4096 - 800;

String myString;
String myString_temp = "";
String myString_temp2 = "";

void setup() {
  Serial.begin(115200);
  Serial.setTimeout(1);
  pwm_40.begin();
  pwm_40.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_41.begin();
  pwm_41.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_42.begin();
  pwm_42.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_43.begin();
  pwm_43.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_44.begin();
  pwm_44.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_45.begin();
  pwm_45.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_60.begin();
  pwm_60.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  pwm_61.begin();
  pwm_61.setPWMFreq(50);  // Analog servos run at ~50 Hz updates
  reset_all_PCA_pins();
}

void loop()
{
  while (!Serial.available());
  myString = Serial.readString();

  if (myString[myString.length() - 2] == 'r')
  {
    myString_temp = myString_temp + myString;
    myString = myString_temp;
    myString_temp = "";

    Serial.println(myString);
    parse_variables(myString);

    if (loop_to_run == 0)
    {
      var1_reset();
      var2_reset();
      var3_reset();
      var4_reset();
      var5_reset();
      var6_reset();
    }

    if (loop_to_run == 1)
    {
      var1_attract(max_attract);
      var4_repel(max_repel);
    }

    if (loop_to_run == 2)
    {
      max_attract = 500;
      max_repel = 4096 - 500;
      var1_attract(max_attract);
      var2_attract(max_attract);
      var3_repel(max_repel);
      var4_repel(max_repel);
      var5_repel(max_repel);
    }

    if (loop_to_run == 3)
    {
      max_repel = 4096 - 200;
      var3_repel(max_repel);
      var4_repel(max_repel);
      var5_repel(max_repel);
      var6_repel(max_repel);
    }

    if (loop_to_run == 5)
    {
      max_attract = 600;
      var11_attract(max_attract);
      var14_repel(max_repel);
    }

    if (loop_to_run == 6)
    {
      max_attract = 600;
      max_repel = 4096 - 600;
      var11_attract(max_attract);
      var12_attract(max_attract);
      var13_repel(max_repel);
      var14_repel(max_repel);
      var15_repel(max_repel);
    }

    if (loop_to_run == 7)
    {
      max_repel = 4096 - 200;
      var13_repel(max_repel);
      var14_repel(max_repel);
      var15_repel(max_repel);
      var16_repel(max_repel);
    }

    if (loop_to_run == 9)
    {
      var11_reset();
      var12_reset();
      var13_reset();
      var14_reset();
      var15_reset();
      var16_reset();
    }
    if (loop_to_run == 10)
    {
      reset_all_PCA_pins();
    }
  }
  else
  {
    myString_temp = myString_temp + myString;
  }
}
