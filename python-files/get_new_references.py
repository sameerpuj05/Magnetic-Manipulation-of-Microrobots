from itertools import count
import cv2 as cv2
from cv2 import EVENT_LBUTTONDOWN
import numpy as np
import time


def mousePoints(event,x,y,flags,param):
    global counter
    
    if event == cv2.EVENT_LBUTTONDOWN:
        if counter==1:
            print("Click Bottom left corner")
        elif counter==2:
            
            print("Click Bottom right corner")
        elif counter==3:
            print("Click Top right corner")

        circles[counter-1]=x,y
        cv2.circle(img,(circles[counter-1][0],circles[counter-1][1]),8,(255,0,255),-1)
        cv2.putText(img,f"{counter}",(circles[counter-1][0]+25,circles[counter-1][1]),cv2.FONT_HERSHEY_SIMPLEX,1,(255,0,255),2,cv2.LINE_AA)
        counter=counter+1

        

counter=1
circles=np.zeros([4,2],dtype=int)
# img= cv2.imread('pcb2.png')
print("hi 1")
vid = cv2.VideoCapture(2)
print("Click Top left corner")

while True:
    ret, img = vid.read()
    img = cv2.resize(img, (1280, 960), fx=0, fy=0,interpolation=cv2.INTER_CUBIC)
    cv2.imshow("thres",img) #dia doesnt matter
    cv2.setMouseCallback("thres",mousePoints) 

    if counter>4:
        cv2.destroyAllWindows()
        print("\nCoordinates are TL/BL/TR/BR\n",circles)
        break

    if cv2.waitKey(20) & 0xFF == ord('d'):
        cv2.destroyAllWindows()
        break
