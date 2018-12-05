% first get the background and foreground pixels I have marked
% then with these data I can use 
% P_R(y_i! x_i=-1)P_G(yi!x_i=-1)P_B(yi!x_i=-1) to calculate the 
% P (pixel!x_i=-1)
% But there are 255*255*255 which are big volume so 
% use kmeans or something we can RGB(255,3,xx)divided into 20 bins
% every bins pixel reprensents the frequence which used for probability
% use knn to find the pixel's classification maybe
% then use the same method to calculate and update the data
