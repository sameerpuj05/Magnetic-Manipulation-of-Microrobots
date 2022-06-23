from itertools import count
import cv2 as cv
from math import atan2, cos, sin, sqrt, pi
import numpy as np
import time
 
def drawAxis(img, p_, q_, color, scale):
    p = list(p_)
    q = list(q_)
    
    ## [visualization1]
    angle = atan2(p[1] - q[1], p[0] - q[0]) # angle in radians
    hypotenuse = sqrt((p[1] - q[1]) * (p[1] - q[1]) + (p[0] - q[0]) * (p[0] - q[0]))
    
    # Here we lengthen the arrow by a factor of scale
    q[0] = p[0] - scale * hypotenuse * cos(angle)
    q[1] = p[1] - scale * hypotenuse * sin(angle)
    cv.line(img, (int(p[0]), int(p[1])), (int(q[0]), int(q[1])), color, 3, cv.LINE_AA)
    
    # create the arrow hooks
    p[0] = q[0] + 9 * cos(angle + pi / 4)
    p[1] = q[1] + 9 * sin(angle + pi / 4)
    cv.line(img, (int(p[0]), int(p[1])), (int(q[0]), int(q[1])), color, 3, cv.LINE_AA)
    
    p[0] = q[0] + 9 * cos(angle - pi / 4)
    p[1] = q[1] + 9 * sin(angle - pi / 4)
    cv.line(img, (int(p[0]), int(p[1])), (int(q[0]), int(q[1])), color, 3, cv.LINE_AA)
    ## [visualization1] 
 
def getOrientation(pts, img):
    ## [pca]
    # Construct a buffer used by the pca analysis
    sz = len(pts)
    data_pts = np.empty((sz, 2), dtype=np.float64)

    for i in range(data_pts.shape[0]):
        data_pts[i,0] = pts[i,0,0]
        data_pts[i,1] = pts[i,0,1]


    # Perform PCA analysis
    mean = np.empty((0))
    mean, eigenvectors, eigenvalues = cv.PCACompute2(data_pts, mean)

    # Store the center of the object
    cntr = (int(mean[0,0]), int(mean[0,1]))
    ## [pca]

    ## [visualization]
    # # Draw the principal components
    cv.circle(img, cntr, 3, (255, 0, 255), 2)
    p1 = (cntr[0] + 0.02 * eigenvectors[0,0] * eigenvalues[0,0], cntr[1] + 0.02 * eigenvectors[0,1] * eigenvalues[0,0])
    p2 = (cntr[0] - 0.02 * eigenvectors[1,0] * eigenvalues[1,0], cntr[1] - 0.02 * eigenvectors[1,1] * eigenvalues[1,0])
    drawAxis(img, cntr, p1, (255, 255, 0), 1)
    drawAxis(img, cntr, p2, (0, 0, 255), 1)
    
    angle = atan2(eigenvectors[0,1], eigenvectors[0,0]) # orientation in radians
    
    return angle,cntr

vid = cv.VideoCapture(2)

while True:

    # Capture the video frame by frame
    (ret, img) = vid.read()
    
    img = cv.resize(img, (960, 720), fx=0, fy=0,interpolation=cv.INTER_CUBIC) 

    # Convert image to grayscale
    gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)

    kernel = np.ones((4,4), np.uint8)
    eroded=cv.erode(gray,kernel,1)

    # Convert image to binary
    _, bw = cv.threshold(eroded, 50, 255, cv.THRESH_BINARY_INV | cv.THRESH_OTSU)

    # Find all the contours in the thresholded image
    contours, _ = cv.findContours(bw, cv.RETR_LIST, cv.CHAIN_APPROX_NONE)

    for i, c in enumerate(contours):
    
        # Calculate the area of each contour
        area = cv.contourArea(c)

        # Ignore contours that are too small or too large
        if area < 10000 or 50000 < area:
            continue

        # Find the orientation of each shape
        # angle, cntr = getOrientation(c, img)

        # Draw each contour only for visualisation purposes
        cv.drawContours(img, contours, i, (0, 0, 255), 2)

        peri=cv.arcLength(c,True)
        approx=cv.approxPolyDP(c,0.02*peri,True)

        x=0
        y=0
        max_temp=0
        max_max_temp=0
        max_max_j=0
        max_max_k=0
        max_j=0
        max_k=0
        # print(approx)
        for j in range(len(approx)):
            for k in range(j+1,len(approx)):
                temp=sqrt((approx[j][0][0]-approx[k][0][0])*(approx[j][0][0]-approx[k][0][0]) + (approx[j][0][1]-approx[k][0][1])*(approx[j][0][1]-approx[k][0][1]))
                # print(temp)
                if (max_max_temp < temp):
                    max_max_temp = temp
                    max_max_j=j
                    max_max_k=k
                elif (max_temp < temp):
                    max_temp = temp
                    max_j=j
                    max_k=k
                    
                
            # print(max_max_temp,max_temp)
            # print(max_j,max_k,max_max_j,max_max_k)
            cv.circle(img,approx[max_max_j][0],3,(0,255,0),3)
            cv.circle(img,approx[max_max_k][0],3,(0,255,0),3)
            
            # if approx[j][0][0] > cntr[0]:
            #     x=x+1
            # if approx[j][0][1] > cntr[1]:
            #     y=y+1
        
        angle=atan2((approx[max_max_k][0][1]-approx[max_max_j][0][1]),(approx[max_max_k][0][0]-approx[max_max_j][0][0]))

        label = str(int(np.rad2deg(angle))) + "deg"
        textbox = cv.rectangle(img, (100, 100-25), (100 + 75, 100 + 10), (255,255,255), -1)
        cv.putText(img, label, (100, 100), cv.FONT_HERSHEY_SIMPLEX, 0.5, (255,5,5), 1, cv.LINE_AA)

    cv.imshow('Output Image', img)

    if cv.waitKey(1) & 0xFF == ord('q'):
        break

# After the loop release the cap object
vid.release()

# Destroy all the windows
cv.destroyAllWindows()