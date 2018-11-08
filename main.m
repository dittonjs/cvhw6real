ballim = imread('ball.bmp');
hsvim = rgb2hsv(ballim);
% hueim = hsvim(:,:,1);
% bwim = imbinarize(hueim, .1);
% cbwim = imcomplement(imclose(bwim, strel("disk", 20)));
% info = regionprops(cbwim, "centroid");
% figure;
% subplot(1, 3, 1); imshow(hueim); title("Just the hue");
% subplot(1, 3, 2); imshow(bwim); title("To black and white, threshold .1");
% subplot(1, 3, 3); imshow(cbwim); title("Perform close and then invert color");
% pause;
% markedim = insertMarker(ballim, info.Centroid);
% figure;
% imshow(markedim); title("Found orange ball");
% disp '*** Finish solving 1.1 ***'
% pause;

vim = hsvim(:,:,3);
bwim = imbinarize(vim, .4);
bwim = medfilt2(bwim);
se = strel('disk', 20);
justshadow = imclearborder(imcomplement(imclose(imclose(bwim, se), se)));
vim(justshadow==1) = 1;
hsvim(:,:,3) = vim;
imshow(hsv2rgb(hsvim));
pause;
close all;