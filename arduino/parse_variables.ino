void parse_variables(String myString)
{
  int length = myString.length();
  String temp = "";
  int var_no = 0;
  for (int i = 0; i <= length; i++)
  {
    if (myString[i] == ',' || myString[i] == '\0')
    {
      if (var_no == 0)
      {
        loop_to_run = temp.toInt();
      }
      if (loop_to_run == 4)
      {
        if (var_no == 1)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var1.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var1.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var1.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 2)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var2.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var2.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var2.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 3)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var3.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var3.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var3.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 4)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var4.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var4.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var4.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 5)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var5.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var5.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var5.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 6)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var6.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var6.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var6.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }
      }

      else if (loop_to_run == 8)
      {

        if (var_no == 1)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var11.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var11.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var11.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 2)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var12.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var12.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var12.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 3)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var13.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var13.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var13.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 4)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var14.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var14.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var14.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 5)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var15.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var15.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var15.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }

        else if (var_no == 6)
        {
          int length_2 = temp.length();
          String temp_2 = "";
          int var_no_2 = 1;
          for (int j = 0; j <= length_2; j++)
          {
            if (temp[j] == ' ' || temp[j] == '\0')
            {
              if (var_no_2 == 1)
              {
                var16.pwm = temp_2.toInt();
              }
              else if (var_no_2 == 2)
              {
                var16.dir = temp_2.toInt();
              }
              else if (var_no_2 == 3)
              {
                var16.ste = temp_2.toInt();
              }
              temp_2 = "";
              var_no_2++;
            }
            else
              temp_2.concat(temp[j]);
          }
        }
      }
      temp = "";
      var_no++;
    }
    else
      temp.concat(myString[i]);
  }
}
