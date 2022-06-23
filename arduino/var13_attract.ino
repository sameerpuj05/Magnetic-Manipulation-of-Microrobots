
void var13_attract(int max_attract)
{
  if (var13.pwm == 40)
  {
    if (var13.dir==10)
    {
      max_attract=max_attract+300;
    }
    pwm_40.setPWM(var13.dir, 0, 4096);
    pwm_40.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 41)
  {
    if (var13.dir==2)
    {
      max_attract=max_attract+300;
    }
    pwm_41.setPWM(var13.dir, 0, 4096);
    pwm_41.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 42)
  {
    if (var13.dir==4)
    {
      max_attract=max_attract+300;
    }
    pwm_42.setPWM(var13.dir, 0, 4096);
    pwm_42.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 43)
  {
    if (var13.dir==8)
    {
      max_attract=max_attract+300;
    }
    pwm_43.setPWM(var13.dir, 0, 4096);
    pwm_43.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 44)
  {
    if (var13.dir==8)
    {
      max_attract=max_attract+300;
    }
    if (var13.dir==12)
    {
      max_attract=max_attract+300;
    }
    pwm_44.setPWM(var13.dir, 0, 4096);
    pwm_44.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 45)
  {
    pwm_45.setPWM(var13.dir, 0, 4096);
    pwm_45.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 60)
  {
    pwm_60.setPWM(var13.dir, 0, 4096);
    pwm_60.setPWM(var13.ste, 0, max_attract);
  }
  else if (var13.pwm == 61)
  {
    pwm_61.setPWM(var13.dir, 0, 4096);
    pwm_61.setPWM(var13.ste, 0, max_attract);
  }
}
