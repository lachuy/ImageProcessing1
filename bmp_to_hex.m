function [s] = bmp_to_hex
img = imread('bai2_bmp.bmp');

img_hex = dec2hex(img);
writematrix(img, 'pic_bmp.txt');  

imshow(img);
title('input image');

s=size(img);