ballim = imread('ball.bmp');
hsvim = rgb2hsv(ballim);
hueim = hsvim(:,:,1);
bwim = imbinarize(hueim, .1);
cbwim = imcomplement(imclose(bwim, strel("disk", 20)));
info = regionprops(cbwim, "centroid");
figure;
subplot(1, 3, 1); imshow(hueim); title("Just the hue");
subplot(1, 3, 2); imshow(bwim); title("To black and white, threshold .1");
subplot(1, 3, 3); imshow(cbwim); title("Perform close and then invert color");
pause;
markedim = insertMarker(ballim, info.Centroid);
figure;
imshow(markedim); title("Found orange ball");
disp '*** Finish solving 1.1 ***'
pause;
close all;