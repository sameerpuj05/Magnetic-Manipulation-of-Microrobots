from ard_dict import *
import time

def center_to_corner_red(center_no,next,arduinoData):
    center_no = center_no + 100
    if(next-center_no)== 0:     # Next is to bottom right
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no - 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no - 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no + 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no + 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no + 9)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"4,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next: {next},Turn on {center_no-1},{center_no-8},{center_no+1}, {center_no+8}, {center_no+9}, {center_no}")
        # arduinoData.write(string_to_send.encode())

    if(next-center_no)== -1:    # Next is to bottom left
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no + 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no - 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no - 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no + 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no + 7)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"4,{val},{val2},{val3},{val4},{val5},{val6}\t") 
        print(f"Current: {center_no}, Next : {next}, Turn on {center_no+1},{center_no-8}, {center_no-1}, {center_no+8}, {center_no+7}, {center_no}")
        # arduinoData.write(string_to_send.encode())
        
    if(next-center_no)== -8:    # Next is top right
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no - 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no + 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no + 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no - 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no - 7)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"4,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next : {next},Turn on {center_no-1},{center_no+8}, {center_no+1}, {center_no-8}, {center_no-7}, {center_no}")
        # arduinoData.write(string_to_send.encode())
        
    if(next-center_no)== -9:     #Next is Top Left
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no + 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no + 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no - 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no - 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no - 9)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"4,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next: {next}, Turn on {center_no+1},{center_no+8}, {center_no-1}, {center_no-8}, {center_no-9},{center_no}")
        # arduinoData.write(string_to_send.encode())

    return string_to_send
        
def center_to_corner_yellow(center_no,next,arduinoData):
    center_no = center_no + 100
    if(next-center_no)== 0:     # Next is to bottom right
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no - 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no - 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no + 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no + 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no + 9)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"8,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next: {next},Turn on {center_no-1},{center_no-8},{center_no+1}, {center_no+8}, {center_no+9}, {center_no}")
        # arduinoData.write(string_to_send.encode())

    if(next-center_no)== -1:    # Next is to bottom left
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no + 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no - 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no - 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no + 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no + 7)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"8,{val},{val2},{val3},{val4},{val5},{val6}\t") 
        print(f"Current: {center_no}, Next : {next}, Turn on {center_no+1},{center_no-8}, {center_no-1}, {center_no+8}, {center_no+7}, {center_no}")
        # arduinoData.write(string_to_send.encode())
        
    if(next-center_no)== -8:    # Next is top right
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no - 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no + 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no + 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no - 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no - 7)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"8,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next : {next},Turn on {center_no-1},{center_no+8}, {center_no+1}, {center_no-8}, {center_no-7}, {center_no}")
        # arduinoData.write(string_to_send.encode())
        
    if(next-center_no)== -9:     #Next is Top Left
        center_no = center_no - 100 #As it denotes center(pink)
        position = key_list_ard.index(center_no + 1)
        val = val_list_ard[position]
        position2 = key_list_ard.index(center_no + 8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(center_no - 1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(center_no - 8)
        val4 = val_list_ard[position4]
        position5 = key_list_ard.index(center_no - 9)
        val5 = val_list_ard[position5]
        position6 = key_list_ard.index(center_no)
        val6 = val_list_ard[position6]
        string_to_send = (f"8,{val},{val2},{val3},{val4},{val5},{val6}\t")
        print(f"Current: {center_no}, Next: {next}, Turn on {center_no+1},{center_no+8}, {center_no-1}, {center_no-8}, {center_no-9},{center_no}")
        # arduinoData.write(string_to_send.encode())

    return string_to_send
