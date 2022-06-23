#!/usr/bin/python
# -*- coding: utf-8 -*-
import code
from operator import ne
import time
import cv2
import numpy as np
import serial
from vpython import *
from corner_to_center import *
from center_to_corner import *
from aStar import *
from ard_dict import *
from imghdr import what
from math import floor
import math
import random

def rgb_to_hsv(r, g, b):
    # R, G, B values are divided by 255 to change the range from 0..255 to 0..1:
    r, g, b = r / 255.0, g / 255.0, b / 255.0
 
    # h, s, v = hue, saturation, value
    cmax = max(r, g, b)    # maximum of r, g, b
    cmin = min(r, g, b)    # minimum of r, g, b
    diff = cmax-cmin       # diff of cmax and cmin.
 
    # if cmax and cmax are equal then h = 0
    if cmax == cmin:
        h = 0
     
    # if cmax equal r then compute h
    elif cmax == r:
        h = (60 * ((g - b) / diff) + 360) % 360
 
    # if cmax equal g then compute h
    elif cmax == g:
        h = (60 * ((b - r) / diff) + 120) % 360
 
    # if cmax equal b then compute h
    elif cmax == b:
        h = (60 * ((r - g) / diff) + 240) % 360
 
    # if cmax equal zero
    if cmax == 0:
        s = 0
    else:
        s = (diff / cmax) * 100
 
    # compute v
    v = cmax * 100
    return round(h), round(s), round(v)

def combined():
    # Declarations
    dataPacket=""
    string_to_send = ""
    break_loop = 0

    # Define arduino COM port
    arduinoData = serial.Serial('/dev/ttyUSB0', baudrate=115200, timeout=.1)

    # Define Destination location/s of bot
    stop_array_red=[31]
    stop_array_yellow=[]
    
    # stop_array_yellow = [129]
    
    # edges = [[TLx, TLy],[BLx, BRy],[BRx, BRy],[TRx, TRy]]
    edges =    [[ 255,   82],
                [ 246,  783],
                [ 949,  801],
                [ 973,  104]]

    # Distance from center waypoint to corner waypoint
    center_to_diag = sqrt(((edges[2][0]-edges[0][0])/8 * (edges[2][0]-edges[0][0])/8 ) * 2)/2
    print(center_to_diag)
    # define a video capture object
    vid = cv2.VideoCapture(2)
    
    # Array declaration for center and corner waypoints
    corners = np.zeros([9, 9, 3], dtype=int)    #[row,col,layer]
    centers = np.zeros([8, 8, 3], dtype=int)

    # Storing centers and corners on the image in arrays
    for x in range(9):
        corners[x][0][0] = round(edges[0][0] + x * ((edges[1][0] - edges[0][0]) / 8))
        corners[x][0][1] = round(edges[0][1] + x * ((edges[1][1] - edges[0][1]) / 8))
        corners[x][8][0] = round(edges[3][0] + x * ((edges[2][0] - edges[3][0]) / 8))
        corners[x][8][1] = round(edges[3][1] + x * ((edges[2][1] - edges[3][1]) / 8))

    # Drawing centers and corners on the image
    for y in range(1,8):
        for x in range(9):
            corners[x][y][0] = round(corners[x][0][0] + y * ((corners[x][8][0] - corners[x][0][0]) / 8))
            corners[x][y][1] = round(corners[x][0][1] + y * ((corners[x][8][1] - corners[x][0][1]) / 8))    

    i=1
    for x in range(8):
        for y in range(8):
            centers[x][y][2] = i
            centers[x][y][0] = round(corners[x][y][0] + (corners[x][y + 1][0] - corners[x][y][0]) / 2)
            centers[x][y][1] = round(corners[x][y][1] + (corners[x + 1][y][1] - corners[x][y][1]) / 2)
            i=i+1

    i = 101
    for x in range(1,8):
        for y in range(1,9):
            corners[x][y][2] = i
            i = i + 1

    # Declarations and initializations
    temp=""
    noman=0
    x_bot_previous=0
    y_bot_previous=0

    stop_i_red=0
    wait_red=0
    wait2_red=0
    monitor_loop_red=0
    x_center_coil_red=0
    y_center_coil_red=0
    x_corner_red=0
    y_corner_red=0
    
    stop_i_yellow=0
    wait_yellow=0
    wait2_yellow=0
    monitor_loop_yellow=0
    x_center_coil_yellow=0
    y_center_coil_yellow=0
    x_corner_yellow=0
    y_corner_yellow=0

    
    # To trace the path formed by bot
    blank = np.ones((960,1280,3)) + 255
    x_bot_previous_red=0
    y_bot_previous_red=0
    x_bot_previous_yellow=0
    y_bot_previous_yellow=0
    
    
    
    time.sleep(2)
    
    # Capture the video frame by frame
    (_, frame) = vid.read()
    
    # Frame resize
    frame = cv2.resize(frame, (1280, 960), fx=0, fy=0,interpolation=cv2.INTER_CUBIC)
    # Masking image inside workspace
    mask = np.zeros(frame.shape[0:2], dtype=np.uint8)
    points = np.array([edges])
    cv2.drawContours(mask, [points], -1, (255, 255, 255), -1, cv2.LINE_AA)
    
    while True:
        begin=time.time()
        
        # Capture the video frame by frame
        (_, frame) = vid.read()
        
        # Frame resize
        frame = cv2.resize(frame, (1280, 960), fx=0, fy=0,interpolation=cv2.INTER_CUBIC)
        
        frame = cv2.bitwise_and(frame,frame,mask = mask)
        
        # Set minimum and max HSV values to display
        lower = np.array([0, 50, 125])
        upper = np.array([45, 255, 255])
        # Create HSV Image and threshold into a range.
        hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        mask2 = cv2.inRange(hsv, lower, upper)
        output = cv2.bitwise_and(frame,frame, mask= mask2)
        bw = cv2.cvtColor(output, cv2.COLOR_BGR2GRAY)
        
        # Find all the contours in the thresholded image
        contours, _ = cv2.findContours(bw, cv2.RETR_LIST, cv2.CHAIN_APPROX_NONE)
        for i, c in enumerate(contours):
    
            # Calculate the area of each contour
            area = cv2.contourArea(c)
            # Ignore contours that are too small or too large
            if area < 3000 or 5000 < area:
                continue
            
            # print(area)
            
            # Draw each contour only for visualisation purposes
            cv2.drawContours(frame, contours, i, (0, 0, 255), 2)      
                  
            x=0
            y=0
            for j in range(len(c)):
                x=x+c[j][0][0]
                y=y+c[j][0][1]
            x_bot=round(x/len(c))
            y_bot=round(y/len(c))
            
            # print(abs(x_bot-x_bot_previous),abs(y_bot-y_bot_previous))
            
            if abs(x_bot-x_bot_previous) < 2 or abs(y_bot-y_bot_previous) < 2:
                x_bot=x_bot_previous
                y_bot=y_bot_previous
            else:
                x_bot_previous=x_bot
                y_bot_previous=y_bot
                
            h,s,v = (hsv[y_bot,x_bot])  
            
            ###################_red ########################        
            if(h<15 and stop_i_red<len(stop_array_red) and len(stop_array_red) != 0):
                cv2.circle(frame, (x_bot, y_bot), 1, (0, 0, 255), 3)   
                
                # To trace the path formed by _yellow bot
                if(x_bot_previous_red==0):
                    x_bot_previous_red=x_bot
                    y_bot_previous_red=y_bot
                cv2.line(blank,(x_bot,y_bot),(x_bot_previous_red,y_bot_previous_red),(255,0,255),2)
                x_bot_previous_red=x_bot
                y_bot_previous_red=y_bot                 
                        
                # Send coil no string to arduino
                if wait_red == 0:
                    start_position_red=0
                    for x in range(8):
                            for y in range(8):
                                if abs(x_bot - centers[x][y][0]) < round(center_to_diag*0.8):
                                    if abs(y_bot - centers[x][y][1]) < round(center_to_diag*0.8):
                                        start_position_red=centers[x][y][2]
                                        noman=1
                                        
                    for x in range(1,8):
                        for y in range(1,9):
                            if abs(x_bot - corners[x][y][0]) < round(center_to_diag/3):
                                if abs(y_bot - corners[x][y][1]) < round(center_to_diag/3):
                                    start_position_red=corners[x][y][2]
                                    noman=0
                                    
                    for x in range(8):
                        for y in range(8):
                            if abs(x_bot - centers[x][y][0]) < round(center_to_diag/3):
                                if abs(y_bot - centers[x][y][1]) < round(center_to_diag/3):
                                    start_position_red=centers[x][y][2]
                                    noman=0
                        
                    # if noman==1:
                    #     print("noman ",end="")
                    # print("start_position_red",start_position_red)
                            
                    # A-star
                    position = val_list.index(start_position_red)
                    start=(key_list[position])
                    position_stop = val_list.index(stop_array_red[stop_i_red])
                    stop=(key_list[position_stop])
                    path = search(maze, 1,start, stop)
                        
                    if(len(path)==1):
                        print('_red - you are at GOAL-',stop_array_red[stop_i_red])
                        stop_i_red = stop_i_red + 1
                        string_to_send = ("0\t")
                        arduinoData.write(bytes(string_to_send, 'utf-8'))
                        time.sleep(0.1)            
                        continue
                    elif noman == 1:
                        noman=0
                        next_red=dict[path[0]]
                    else:
                        next_red=dict[path[1]]
                            
                    wait_red = 1
                    wait2_red = 0
                        
                    # print(start_position_red,next_red)
                        
                    if start_position_red > 100 and next_red<100:                 # For Corner to Center
                        string_to_send = corner_to_center_red(start_position_red,next_red,arduinoData)
                        monitor_loop_red = 0
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == next_red:
                                    x_center_coil_red=centers[x][y][0]
                                    y_center_coil_red=centers[x][y][1]
                                    
                        for x in range(1,8):
                            for y in range(1,9):
                                if corners[x][y][2] == start_position_red:
                                    x_corner_red=corners[x][y][0]
                                    y_corner_red=corners[x][y][1]
                        
                        cv2.line(blank,(x_corner_red,y_corner_red),(x_center_coil_red,y_center_coil_red),(0,0,0),3)
                        
                                   
                    elif(start_position_red<100 and next_red>100):               # For Center to Corner
                        string_to_send = center_to_corner_red(start_position_red,next_red,arduinoData)
                        monitor_loop_red = 1  
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == start_position_red:
                                    x_center_coil_red=centers[x][y][0]
                                    y_center_coil_red=centers[x][y][1]                                  
                        for x in range(1,8):
                            for y in range(1,9):
                                if corners[x][y][2] == next_red:
                                    x_corner_red=corners[x][y][0]
                                    y_corner_red=corners[x][y][1]

                        cv2.line(blank,(x_center_coil_red,y_center_coil_red),(x_corner_red,y_corner_red),(0,0,0),3)
                    
                    if (start_position_red < 100 and next_red < 100):
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == next_red:
                                    x_center_coil_red=centers[x][y][0]
                                    y_center_coil_red=centers[x][y][1]
                        position = key_list_ard.index(next_red)
                        val = val_list_ard[position]
                        string_to_send= (f"4,{val}\t")
                        print(string_to_send)
                        
                elif wait_red == 1:
                    ########################
                    # # For Corner to Center
                    if monitor_loop_red ==0:
                        if wait2_red==0:
                            print(f"_red - Attract at center-{next_red}")
                            string_to_send = "1\t"
                            wait2_red=1

                        if abs(x_bot-x_center_coil_red)< 9 or abs(y_bot-y_center_coil_red)< 9 and wait2_red==1:
                            print(f"_red - reset")
                            string_to_send = "0\t"
                            wait_red=0
                
                    ########################
                    # # For Center to Corner
                    elif  monitor_loop_red == 1:
                        if wait2_red==0:
                            print(f"_red - Repel towards corner-{next_red}")
                            string_to_send = "2\t"
                            wait2_red = 1

                        elif wait2_red == 1:
                            print(x_center_coil_red,x_bot,y_bot,y_center_coil_red)
                            if next_red-start_position_red == 91 and (x_center_coil_red-x_bot)>5 and (y_center_coil_red-y_bot)>5:
                                wait2_red = 2
                                print(f"_red - Pull at corner-{next_red}")
                                string_to_send = "0\t"
                            if next_red-start_position_red == 92 and (x_bot-x_center_coil_red)>5 and (y_center_coil_red-y_bot)>5:
                                wait2_red = 2
                                print(f"_red - Pull at corner-{next_red}")
                                string_to_send = "0\t"
                            if next_red-start_position_red == 99 and (x_center_coil_red-x_bot)>5 and (y_bot-y_center_coil_red)>5:
                                wait2_red = 2
                                print(f"_red - Pull at corner-{next_red}")
                                string_to_send = "0\t"
                            if next_red-start_position_red == 100 and (x_bot-x_center_coil_red)>5 and (y_bot-y_center_coil_red)>5:
                                wait2_red = 2
                                print(f"_red - Pull at corner-{next_red}")
                                string_to_send = "0\t"
                        
                        elif wait2_red == 2:
                            string_to_send = "3\t"
                            wait2_red = 3
                    
                        elif abs(x_bot-x_corner_red)<15 and abs(y_bot-y_corner_red)<15 and wait2_red==3:
                            string_to_send = "0\t"
                            print(f"_red - reset\n")                                
                            wait_red=0
                    
            
            ###################_yellow ########################        
            elif(h>15 and h< 45 and stop_i_yellow<len(stop_array_yellow) and len(stop_array_yellow) != 0):
                cv2.circle(frame, (x_bot, y_bot), 1, (0, 255, 255), 3)  
                
                # To trace the path formed by _yellow bot
                if(x_bot_previous_yellow==0):
                    x_bot_previous_yellow=x_bot
                    y_bot_previous_yellow=y_bot
                cv2.line(blank,(x_bot,y_bot),(x_bot_previous_yellow,y_bot_previous_yellow),(0,0,255),2)
                x_bot_previous_yellow=x_bot
                y_bot_previous_yellow=y_bot
                                  
                        
                # Send coil no string to arduino
                if wait_yellow == 0:
                    start_position_yellow=0
                    for x in range(8):
                            for y in range(8):
                                if abs(x_bot - centers[x][y][0]) < round(center_to_diag*0.8):
                                    if abs(y_bot - centers[x][y][1]) < round(center_to_diag*0.8):
                                        start_position_yellow=centers[x][y][2]
                                        noman=1
                                        
                    for x in range(1,8):
                        for y in range(1,9):
                            if abs(x_bot - corners[x][y][0]) < round(center_to_diag/3):
                                if abs(y_bot - corners[x][y][1]) < round(center_to_diag/3):
                                    start_position_yellow=corners[x][y][2]
                                    noman=0
                                    
                    for x in range(8):
                        for y in range(8):
                            if abs(x_bot - centers[x][y][0]) < round(center_to_diag/3):
                                if abs(y_bot - centers[x][y][1]) < round(center_to_diag/3):
                                    start_position_yellow=centers[x][y][2]
                                    noman=0
                        
                    # if noman==1:
                    #     print("noman ",end="")
                    print("start_position_yellow",start_position_yellow)
                            
                    # A-star
                    position = val_list.index(start_position_yellow)
                    start=(key_list[position])
                    position_stop = val_list.index(stop_array_yellow[stop_i_yellow])
                    stop=(key_list[position_stop])
                    path = search(maze, 1,start, stop)
                        
                    if(len(path)==1):
                        print('_yellow - you are at GOAL-',stop_array_yellow[stop_i_yellow])
                        stop_i_yellow = stop_i_yellow + 1
                        string_to_send = ("9\t")
                        arduinoData.write(bytes(string_to_send, 'utf-8'))
                        time.sleep(0.1)            
                        continue
                    elif noman == 1:
                        noman=0
                        next_yellow=dict[path[0]]
                    else:
                        next_yellow=dict[path[1]]
                        
                        
                        
                    
                            
                    wait_yellow = 1
                    wait2_yellow = 0
                        
                    # print(start_position_yellow,next_yellow)
                        
                    if start_position_yellow > 100 and next_yellow<100:                 # For Corner to Center
                        string_to_send = corner_to_center_yellow(start_position_yellow,next_yellow,arduinoData)
                        monitor_loop_yellow = 0
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == next_yellow:
                                    x_center_coil_yellow=centers[x][y][0]
                                    y_center_coil_yellow=centers[x][y][1]
                                    
                        for x in range(1,8):
                            for y in range(1,9):
                                if corners[x][y][2] == start_position_yellow:
                                    x_corner_yellow=corners[x][y][0]
                                    y_corner_yellow=corners[x][y][1]
                                    
                        cv2.line(blank,(x_corner_yellow,y_corner_yellow),(x_center_coil_yellow,y_center_coil_yellow),(0,0,0),3)
                                    
                    elif(start_position_yellow<100 and next_yellow>100):               # For Center to Corner
                        string_to_send = center_to_corner_yellow(start_position_yellow,next_yellow,arduinoData)
                        monitor_loop_yellow = 1       
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == start_position_yellow:
                                    x_center_coil_yellow=centers[x][y][0]
                                    y_center_coil_yellow=centers[x][y][1]                                
                        for x in range(1,8):
                            for y in range(1,9):
                                if corners[x][y][2] == next_yellow:
                                    x_corner_yellow=corners[x][y][0]
                                    y_corner_yellow=corners[x][y][1]
                                    
                        cv2.line(blank,(x_center_coil_yellow,y_center_coil_yellow),(x_corner_yellow,y_corner_yellow),(0,0,0),3)
                    
                    if (start_position_yellow < 100 and next_yellow < 100):
                        for x in range(8):
                            for y in range(8):
                                if centers[x][y][2] == next_yellow:
                                    x_center_coil_yellow=centers[x][y][0]
                                    y_center_coil_yellow=centers[x][y][1]
                        position = key_list_ard.index(next_yellow)
                        val = val_list_ard[position]
                        string_to_send= (f"8,{val}\t")
                        print(string_to_send)
                        
                    
    
                
                elif wait_yellow == 1:
                    ########################
                    # # For Corner to Center
                    if monitor_loop_yellow ==0:
                        if wait2_yellow==0:
                            print(f"_yellow - Attract at center-{next_yellow}")
                            string_to_send = "5\t"
                            wait2_yellow=1

                        if abs(x_bot-x_center_coil_yellow)< 9 or abs(y_bot-y_center_coil_yellow)< 9 and wait2_yellow==1:
                            print(f"_yellow - reset")
                            string_to_send = "9\t"
                            wait_yellow=0
                            
                    ########################
                    # # For Center to Corner
                    elif  monitor_loop_yellow == 1:
                        if wait2_yellow==0:
                            print(f"_yellow - Repel towards corner-{next_yellow}")
                            string_to_send = "6\t"
                            wait2_yellow = 1

                        elif wait2_yellow == 1:
                            # print(x_center_coil_yellow,x_bot,y_bot,y_center_coil_yellow)
                            if next_yellow-start_position_yellow == 91 and (x_center_coil_yellow-x_bot)>5 and (y_center_coil_yellow-y_bot)>5:
                                wait2_yellow = 2
                                print(f"_yellow - Pull at corner-{next_yellow}")
                                string_to_send = "9\t"
                            if next_yellow-start_position_yellow == 92 and (x_bot-x_center_coil_yellow)>5 and (y_center_coil_yellow-y_bot)>5:
                                wait2_yellow = 2
                                print(f"_yellow - Pull at corner-{next_yellow}")
                                string_to_send = "9\t"
                            if next_yellow-start_position_yellow == 99 and (x_center_coil_yellow-x_bot)>5 and (y_bot-y_center_coil_yellow)>5:
                                wait2_yellow = 2
                                print(f"_yellow - Pull at corner-{next_yellow}")
                                string_to_send = "9\t"
                            if next_yellow-start_position_yellow == 100 and (x_bot-x_center_coil_yellow)>5 and (y_bot-y_center_coil_yellow)>5:
                                wait2_yellow = 2
                                print(f"_yellow - Pull at corner-{next_yellow}")
                                string_to_send = "9\t"
                        
                        elif wait2_yellow == 2:
                            string_to_send = "7\t"
                            wait2_yellow = 3
                    
                        elif abs(x_bot-x_corner_yellow)<15 and abs(y_bot-y_corner_yellow)<15 and wait2_yellow==3:
                            string_to_send = "9\t"
                            print(f"_yellow - reset\n")                                
                            wait_yellow=0
                    
                
            
            if (string_to_send != ""):
                data=""
                while(string_to_send != data):
                    temp=string_to_send
                    arduinoData.write(bytes(string_to_send, 'utf-8'))
                    print("arduinoData_write = ",string_to_send)
                    time.sleep(0.25)
                    data = arduinoData.readline()
                    data= data.decode()
                    data= data.strip('\r\n')
                    print("arduinoData_read  = ",data,"\n")
                    begin1=time.time()
                string_to_send= ""
                
            else:
                end1=time.time()
                if (end1-begin1) > 4:
                    print("reset")
                    wait_red=0
                    wait_yellow=0
                    string_to_send = "10\t"
                    arduinoData.write(bytes(string_to_send, 'utf-8'))
                    time.sleep(1)
                
                
                        
        # Drawing centers and corners on the image    
        for x in range(1,8):
            for y in range(1,9):
                cv2.putText(frame,f'{corners[x][y][2]}',(corners[x][y][0]+5,corners[x][y][1]),cv2.FONT_HERSHEY_SIMPLEX,0.5,(0,255,255),1,cv2.LINE_AA)
                cv2.circle(frame,(corners[x][y][0],corners[x][y][1]),3,(0,255,255),-1)
                # cv2.circle(frame,(corners[x][y][0],corners[x][y][1]),round(center_to_diag/2.8),(0,255,255),1)

        for x in range(8):
            for y in range(8):
                cv2.putText(frame,f'{centers[x][y][2]}',(centers[x][y][0]+5,centers[x][y][1]),cv2.FONT_HERSHEY_SIMPLEX,0.5,(255,0,255),1,cv2.LINE_AA)
                cv2.circle(frame,(centers[x][y][0],centers[x][y][1]),3,(255,0,255),-1)
                # cv2.circle(frame,(centers[x][y][0],centers[x][y][1]),round(center_to_diag/2.8),(0,25,255),1)
                # cv2.circle(frame,(centers[x][y][0],centers[x][y][1]),round(center_to_diag*0.8),(0,25,255),1)
             
        cv2.imshow("frame",frame)
        # cv2.imshow("blank",blank)
        
        if (cv2.waitKey(1) & 0xFF == ord('q')) or ((stop_i_yellow>=len(stop_array_yellow)) and (stop_i_red>=len(stop_array_red))):
            string_to_send = ("10\t")
            arduinoData.write(bytes(string_to_send, 'utf-8'))
            time.sleep(0.25)        
            break        
        
        finish=time.time()
        # print("fps = " ,(1/(finish-begin)))
        
    # After the loop release the cap object
    vid.release()

    # Destroy all the windows
    cv2.destroyAllWindows()
        
if __name__ == "__main__":
    combined()
    print("Done!")

