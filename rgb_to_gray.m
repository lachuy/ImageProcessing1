function [] = rgb_to_gray
imgIn = imread('baitap2_anhgoc.jpg');

fid = fopen('out_imagegray.txt','r');
img = fscanf(fid,'%x');
fclose(fid);

imgOut = reshape(img, [1153 2048]);

subplot(121);
imshow(imgIn);
title('input image');
subplot(122);
imshow(imgOut,[]);
title('output image');
