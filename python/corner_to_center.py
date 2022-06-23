from ard_dict import *
import time

def corner_to_center_red(corner_no,next,arduinoData):
    if(next - (corner_no-100) == 0):    # Next is top left    
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next+1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+8)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next+9)
        val4 = val_list_ard[position4]
        string_to_send = (f"4,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next},{next+1},{next+8},{next+9}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 1):    # Next is top right        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+7)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next+8)
        val4 = val_list_ard[position4]
        string_to_send = (f"4,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next  : {next}, Turn on {next},{next-1},{next+8},{next+7}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 8):    # Next is bottom left        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next-7)
        val4 = val_list_ard[position4]
        string_to_send = (f"4,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next},{next-8},{next-7},{next+1}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 9):    # next is bottom right        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next-8)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next-9)
        val4 = val_list_ard[position4]
        string_to_send = (f"4,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next},{next-1},{next-8},{next-9}")
        # arduinoData.write(string_to_send.encode())

    return string_to_send
    
def corner_to_center_yellow(corner_no,next,arduinoData):
    if(next - (corner_no-100) == 0):    # Next is top left    
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next+1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+8)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next+9)
        val4 = val_list_ard[position4]
        string_to_send = (f"8,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next},{next+1},{next+8},{next+9}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 1):    # Next is top right        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+7)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next+8)
        val4 = val_list_ard[position4]
        string_to_send = (f"8,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next  : {next}, Turn on {next},{next-1},{next+8},{next+7}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 8):    # Next is bottom left        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-8)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next+1)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next-7)
        val4 = val_list_ard[position4]
        string_to_send = (f"8,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next}, {next-8},{next-7},{next+1}")
        # arduinoData.write(string_to_send.encode())
            
    if(next - (corner_no-100) == 9):    # next is bottom right        
        position = key_list_ard.index(next)
        val = val_list_ard[position]
        position2 = key_list_ard.index(next-1)
        val2 = val_list_ard[position2]
        position3 = key_list_ard.index(next-8)
        val3 = val_list_ard[position3]
        position4 = key_list_ard.index(next-9)
        val4 = val_list_ard[position4]
        string_to_send = (f"8,{val},{val2},{val3},{val4}\t")
        print(f"Current : {corner_no}, Next : {next}, Turn on {next}, {next-1},{next-8},{next-9}")
        # arduinoData.write(string_to_send.encode())

    return string_to_send
    