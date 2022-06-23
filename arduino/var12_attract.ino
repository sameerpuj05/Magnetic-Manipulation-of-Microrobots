
void var12_attract(int max_attract)
{
  if (var12.pwm == 40)
  {
    if (var12.dir==10)
    {
      max_attract=max_attract+300;
    }
    pwm_40.setPWM(var12.dir, 0, 4096);
    pwm_40.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 41)
  {
    if (var12.dir==2)
    {
      max_attract=max_attract+300;
    }
    pwm_41.setPWM(var12.dir, 0, 4096);
    pwm_41.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 42)
  {
    if (var12.dir==4)
    {
      max_attract=max_attract+300;
    }
    pwm_42.setPWM(var12.dir, 0, 4096);
    pwm_42.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 43)
  {
    if (var12.dir==8)
    {
      max_attract=max_attract+300;
    }
    pwm_43.setPWM(var12.dir, 0, 4096);
    pwm_43.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 44)
  {
    if (var12.dir==8)
    {
      max_attract=max_attract+300;
    }
    if (var12.dir==12)
    {
      max_attract=max_attract+300;
    }
    pwm_44.setPWM(var12.dir, 0, 4096);
    pwm_44.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 45)
  {
    pwm_45.setPWM(var12.dir, 0, 4096);
    pwm_45.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 60)
  {
    pwm_60.setPWM(var12.dir, 0, 4096);
    pwm_60.setPWM(var12.ste, 0, max_attract);
  }
  else if (var12.pwm == 61)
  {
    pwm_61.setPWM(var12.dir, 0, 4096);
    pwm_61.setPWM(var12.ste, 0, max_attract);
  }
}
