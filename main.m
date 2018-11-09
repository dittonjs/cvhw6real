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

horseim1 = imread('Horse1.jpg');
horseim2 = imread('Horse2.jpg');
eleim1 = imread('Elephant1.jpg');
eleim2 = imread('Elephant2.jpg');

h1hist = CalNormalizedHSVHist(horseim1, 4, 4, 4);
h2hist = CalNormalizedHSVHist(horseim2, 4, 4, 4);
e1hist = CalNormalizedHSVHist(eleim1, 4, 4, 4);
e2hist = CalNormalizedHSVHist(eleim2, 4, 4, 4);
figure;
subplot(2,2,1); bar(h1hist); title("Horse1");
subplot(2,2,2); bar(h2hist); title("Horse2");
subplot(2,2,3); bar(e1hist); title("Elephant1");
subplot(2,2,4); bar(e2hist); title("Elephant2");
pause;

h1h1score = CalSimilarity(h1hist, h1hist);
h1h2score = CalSimilarity(h1hist, h2hist);
h1e1score = CalSimilarity(h1hist, e1hist);
h1e2score = CalSimilarity(h1hist, e2hist);

h2h2score = CalSimilarity(h2hist, h2hist);
h2e1score = CalSimilarity(h1hist, e1hist);
h2e2score = CalSimilarity(h1hist, e2hist);

e1e1score = CalSimilarity(e1hist, e1hist);
e1e2score = CalSimilarity(h1hist, e1hist);
figure; title('horse1 as query');
pause;
close all;
