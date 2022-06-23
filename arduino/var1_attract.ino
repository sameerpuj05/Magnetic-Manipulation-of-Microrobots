
void var1_attract(int max_attract)
{
  if (var1.pwm == 40)
  {
    if (var1.dir==10)
    {
      max_attract=max_attract+300;
    }
    pwm_40.setPWM(var1.dir, 0, 4096);
    pwm_40.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 41)
  {
    if (var1.dir==2)
    {
      max_attract=max_attract+300;
    }
    pwm_41.setPWM(var1.dir, 0, 4096);
    pwm_41.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 42)
  {
    if (var1.dir==4)
    {
      max_attract=max_attract+300;
    }
    pwm_42.setPWM(var1.dir, 0, 4096);
    pwm_42.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 43)
  {
    if (var1.dir==8)
    {
      max_attract=max_attract+300;
    }
    pwm_43.setPWM(var1.dir, 0, 4096);
    pwm_43.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 44)
  {
    if (var1.dir==8)
    {
      max_attract=max_attract+300;
    }
    if (var1.dir==12)
    {
      max_attract=max_attract+300;
    }
    pwm_44.setPWM(var1.dir, 0, 4096);
    pwm_44.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 45)
  {
    pwm_45.setPWM(var1.dir, 0, 4096);
    pwm_45.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 60)
  {
    pwm_60.setPWM(var1.dir, 0, 4096);
    pwm_60.setPWM(var1.ste, 0, max_attract);
  }
  else if (var1.pwm == 61)
  {
    pwm_61.setPWM(var1.dir, 0, 4096);
    pwm_61.setPWM(var1.ste, 0, max_attract);
  }
}
