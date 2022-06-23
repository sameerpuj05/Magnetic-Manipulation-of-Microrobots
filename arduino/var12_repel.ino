
void var12_repel(int max_repel)
{
  if (var12.pwm == 40)
  {
    if (var12.dir==10)
    {
      max_repel=max_repel+300;
    }
    pwm_40.setPWM(var12.dir, 4096, 0);
    pwm_40.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 41)
  {
    if (var12.dir==2)
    {
      max_repel=max_repel+300;
    }
    pwm_41.setPWM(var12.dir, 4096, 0);
    pwm_41.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 42)
  {
    if (var12.dir==4)
    {
      max_repel=max_repel+600;
    }
    pwm_42.setPWM(var12.dir, 4096, 0);
    pwm_42.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 43)
  {
    if (var12.dir==8)
    {
      max_repel=max_repel+300;
    }
    pwm_43.setPWM(var12.dir, 4096, 0);
    pwm_43.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 44)
  {
    if (var12.dir==8)
    {
      max_repel=max_repel+300;
    }
    if (var12.dir==12)
    {
      max_repel=max_repel+300;
    }
    pwm_44.setPWM(var12.dir, 4096, 0);
    pwm_44.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 45)
  {
    pwm_45.setPWM(var12.dir, 4096, 0);
    pwm_45.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 60)
  {
    pwm_60.setPWM(var12.dir, 4096, 0);
    pwm_60.setPWM(var12.ste, 0, max_repel);
  }
  else if (var12.pwm == 61)
  {
    pwm_61.setPWM(var12.dir, 4096, 0);
    pwm_61.setPWM(var12.ste, 0, max_repel);
  }
}
