#include <Adafruit_PWMServoDriver.h>

Adafruit_PWMServoDriver pwm_40 = Adafruit_PWMServoDriver(0x40);
Adafruit_PWMServoDriver pwm_41 = Adafruit_PWMServoDriver(0x41);
Adafruit_PWMServoDriver pwm_42 = Adafruit_PWMServoDriver(0x42);
Adafruit_PWMServoDriver pwm_43 = Adafruit_PWMServoDriver(0x43);
Adafruit_PWMServoDriver pwm_44 = Adafruit_PWMServoDriver(0x44);
Adafruit_PWMServoDriver pwm_45 = Adafruit_PWMServoDriver(0x45);
Adafruit_PWMServoDriver pwm_60 = Adafruit_PWMServoDriver(0x60);
Adafruit_PWMServoDriver pwm_61 = Adafruit_PWMServoDriver(0x61);

int dir;
int step_size;

void reset_all_PCA_pins();

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pwm_40.begin();
  pwm_40.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_41.begin();
  pwm_41.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_42.begin();
  pwm_42.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_43.begin();
  pwm_43.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_44.begin();
  pwm_44.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_45.begin();
  pwm_45.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_60.begin();
  pwm_60.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  pwm_61.begin();
  pwm_61.setPWMFreq(100);  // Analog servos run at ~50 Hz updates
  reset_all_PCA_pins();
  Serial.println("setup Finish");
}

float AcsValueF = 0.0;

void current_loop()
{
  unsigned int x = 0;
  float AcsValue = 0.0, Samples = 0.0, AvgAcs = 0.0;

  for (int x = 0; x < 100; x++) { //Get 150 samples
    AcsValue = analogRead(A2);     //Read current sensor values
    Samples = Samples + AcsValue;  //Add samples together
    delay (3); // let ADC settle before next sample 3ms
  }
  Serial.println(AvgAcs);
  AvgAcs = Samples / 100.0; //Taking Average of Samples
  AcsValueF = (2.5 - (AvgAcs * (5./0 / 1024.0)) ) / 0.185;
  AcsValueF = AcsValueF - 0.05;
}


void loop() {
  // put your main code here, to run repeatedly:
  current_loop();
  if (AcsValueF > 1)
  {
    Serial.println("DANGER");
    //        break;
  }

  Serial.println("40");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_40(dir, step_size);
  }
  delay(1);
  Serial.println("40");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_40(dir, step_size);
  }
  delay(1);
  Serial.println("41");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_41(dir, step_size);
  }
  delay(1);
  Serial.println("41");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_41(dir, step_size);
  }
  delay(1);
  Serial.println("42");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_42(dir, step_size);
  }
  delay(1);
  Serial.println("42");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_42(dir, step_size);
  }
  delay(1);
  Serial.println("43");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_43(dir, step_size);
  }
  delay(1);
  Serial.println("43");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_43(dir, step_size);
  }
  delay(1);
  Serial.println("44");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_44(dir, step_size);
  }
  delay(1);
  Serial.println("44");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_44(dir, step_size);
  }
  delay(1);
  Serial.println("45");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_45(dir, step_size);
  }
  delay(1);
  Serial.println("45");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_45(dir, step_size);
  }
  delay(1);

  Serial.println("60");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_60(dir, step_size);
  }
  delay(1);
  Serial.println("61");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    attract_61(dir, step_size);
  }
  delay(1);
  Serial.println("60");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_60(dir, step_size);
  }
  delay(1);
  Serial.println("61");
  for (int i = 1; i < 9; i++) {
    dir = 0 + 2 * (i - 1);
    step_size = 1 + 2 * (i - 1);
    repel_61(dir, step_size);
  }
}

void attract_40(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_40.setPWM(dir, 0, 4096);
    pwm_40.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_40.setPWM(dir, 0, 4096);
  pwm_40.setPWM(step_size, 0, 4096);
}

void repel_40(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_40.setPWM(dir, 4096, 0);
    pwm_40.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_40.setPWM(dir, 0, 4096);
  pwm_40.setPWM(step_size, 0, 4096);
}

void attract_41(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_41.setPWM(dir, 0, 4096);
    pwm_41.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_41.setPWM(dir, 0, 4096);
  pwm_41.setPWM(step_size, 0, 4096);
}

void repel_41(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_41.setPWM(dir, 4096, 0);
    pwm_41.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_41.setPWM(dir, 0, 4096);
  pwm_41.setPWM(step_size, 0, 4096);
}

void attract_42(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_42.setPWM(dir, 0, 4096);
    pwm_42.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_42.setPWM(dir, 0, 4096);
  pwm_42.setPWM(step_size, 0, 4096);
}

void repel_42(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_42.setPWM(dir, 4096, 0);
    pwm_42.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_42.setPWM(dir, 0, 4096);
  pwm_42.setPWM(step_size, 0, 4096);
}

void attract_43(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_43.setPWM(dir, 0, 4096);
    pwm_43.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_43.setPWM(dir, 0, 4096);
  pwm_43.setPWM(step_size, 0, 4096);
}

void repel_43(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_43.setPWM(dir, 4096, 0);
    pwm_43.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_43.setPWM(dir, 0, 4096);
  pwm_43.setPWM(step_size, 0, 4096);
}


void attract_44(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_44.setPWM(dir, 0, 4096);
    pwm_44.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_44.setPWM(dir, 0, 4096);
  pwm_44.setPWM(step_size, 0, 4096);
}

void attract_45(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_45.setPWM(dir, 0, 4096);
    pwm_45.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_45.setPWM(dir, 0, 4096);
  pwm_45.setPWM(step_size, 0, 4096);
}

void repel_44(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_44.setPWM(dir, 4096, 0);
    pwm_44.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_44.setPWM(dir, 0, 4096);
  pwm_44.setPWM(step_size, 0, 4096);
}

void repel_45(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_45.setPWM(dir, 4096, 0);
    pwm_45.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_45.setPWM(dir, 0, 4096);
  pwm_45.setPWM(step_size, 0, 4096);
}



void attract_60(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_60.setPWM(dir, 0, 4096);
    pwm_60.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_60.setPWM(dir, 0, 4096);
  pwm_60.setPWM(step_size, 0, 4096);
}

void attract_61(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_61.setPWM(dir, 0, 4096);
    pwm_61.setPWM(step_size, 0, max_attract);
    int dir_2;
    current_loop();
    Serial.print("ATTRACT. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_61.setPWM(dir, 0, 4096);
  pwm_61.setPWM(step_size, 0, 4096);
}

void repel_60(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_60.setPWM(dir, 4096, 0);
    pwm_60.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_60.setPWM(dir, 0, 4096);
  pwm_60.setPWM(step_size, 0, 4096);
}

void repel_61(int dir, int step_size)
{
  int max_attract = 600;
  int max_repel = 4096 - 600;

  for (int i = 0; i < 3; i++)
  {
    AcsValueF = 0;
    pwm_61.setPWM(dir, 4096, 0);
    pwm_61.setPWM(step_size, 0, max_repel);
    int dir_2;
    current_loop();
    Serial.print("REPEL. ");
    if (AcsValueF > 1) {
      Serial.println("DANGER");
      break;
    }
    else if (AcsValueF > 0.3) {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print(" Working fine. Current ");
      Serial.println(AcsValueF);
    }
    else {
      dir_2 = dir / 2 + 1;
      Serial.print("Coil ");
      Serial.print(dir_2);
      Serial.print("Working NOT NOT fine. Current ");
      Serial.println(AcsValueF);
    }
  }

  pwm_61.setPWM(dir, 0, 4096);
  pwm_61.setPWM(step_size, 0, 4096);
}


void reset_all_PCA_pins()
{
  pwm_40.setPWM(0, 0, 4096);
  pwm_40.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(2, 0, 4096);
  pwm_40.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(4, 0, 4096);
  pwm_40.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(6, 0, 4096);
  pwm_40.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(8, 0, 4096);
  pwm_40.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(10, 0, 4096);
  pwm_40.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(12, 0, 4096);
  pwm_40.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_40.setPWM(14, 0, 4096);
  pwm_40.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(0, 0, 4096);
  pwm_41.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(2, 0, 4096);
  pwm_41.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(4, 0, 4096);
  pwm_41.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(6, 0, 4096);
  pwm_41.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(8, 0, 4096);
  pwm_41.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(10, 0, 4096);
  pwm_41.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(12, 0, 4096);
  pwm_41.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_41.setPWM(14, 0, 4096);
  pwm_41.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(0, 0, 4096);
  pwm_42.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(2, 0, 4096);
  pwm_42.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(4, 0, 4096);
  pwm_42.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(6, 0, 4096);
  pwm_42.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(8, 0, 4096);
  pwm_42.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(10, 0, 4096);
  pwm_42.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(12, 0, 4096);
  pwm_42.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_42.setPWM(14, 0, 4096);
  pwm_42.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(0, 0, 4096);
  pwm_43.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(2, 0, 4096);
  pwm_43.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(4, 0, 4096);
  pwm_43.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(6, 0, 4096);
  pwm_43.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(8, 0, 4096);
  pwm_43.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(10, 0, 4096);
  pwm_43.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(12, 0, 4096);
  pwm_43.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_43.setPWM(14, 0, 4096);
  pwm_43.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(0, 0, 4096);
  pwm_44.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(2, 0, 4096);
  pwm_44.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(4, 0, 4096);
  pwm_44.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(6, 0, 4096);
  pwm_44.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(8, 0, 4096);
  pwm_44.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(10, 0, 4096);
  pwm_44.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(12, 0, 4096);
  pwm_44.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_44.setPWM(14, 0, 4096);
  pwm_44.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(0, 0, 4096);
  pwm_45.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(2, 0, 4096);
  pwm_45.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(4, 0, 4096);
  pwm_45.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(6, 0, 4096);
  pwm_45.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(8, 0, 4096);
  pwm_45.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(10, 0, 4096);
  pwm_45.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(12, 0, 4096);
  pwm_45.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_45.setPWM(14, 0, 4096);
  pwm_45.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(0, 0, 4096);
  pwm_60.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(2, 0, 4096);
  pwm_60.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(4, 0, 4096);
  pwm_60.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(6, 0, 4096);
  pwm_60.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(8, 0, 4096);
  pwm_60.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(10, 0, 4096);
  pwm_60.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(12, 0, 4096);
  pwm_60.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_60.setPWM(14, 0, 4096);
  pwm_60.setPWM(15, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(0, 0, 4096);
  pwm_61.setPWM(1, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(2, 0, 4096);
  pwm_61.setPWM(3, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(4, 0, 4096);
  pwm_61.setPWM(5, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(6, 0, 4096);
  pwm_61.setPWM(7, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(8, 0, 4096);
  pwm_61.setPWM(9, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(10, 0, 4096);
  pwm_61.setPWM(11, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(12, 0, 4096);
  pwm_61.setPWM(13, 0, 4096); //LOW - ATTRACTS
  pwm_61.setPWM(14, 0, 4096);
  pwm_61.setPWM(15, 0, 4096); //LOW - ATTRACTS
}
