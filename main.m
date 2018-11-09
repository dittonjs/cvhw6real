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

vim = hsvim(:,:,3);
bwim = imbinarize(vim, .4);
bwim = medfilt2(bwim);
se = strel('disk', 20);
justshadow = imclearborder(imcomplement(imclose(imclose(bwim, se), se)));
vim(justshadow==1) = 1;
hsvim(:,:,3) = vim;
imshow(hsv2rgb(hsvim));
disp '*** Finish solving 1.2 ***'
pause;

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
disp '*** Finish solving 2.1 ***'
pause;

h1h1score = CalSimilarity(h1hist, h1hist);
h1h2score = CalSimilarity(h1hist, h2hist);
h1e1score = CalSimilarity(h1hist, e1hist);
h1e2score = CalSimilarity(h1hist, e2hist);

h2h2score = CalSimilarity(h2hist, h2hist);
h2e1score = CalSimilarity(h2hist, e1hist);
h2e2score = CalSimilarity(h2hist, e2hist);

e1e1score = CalSimilarity(e1hist, e1hist);
e1e2score = CalSimilarity(e1hist, e2hist);

e2e2score = CalSimilarity(e2hist, e2hist);

figure;
subplot(2, 2, 1); imshow(horseim1); title("Rank 1 (Horse 1)");
subplot(2, 2, 2); imshow(horseim2); title("Rank 2 (Horse 1)");
subplot(2, 2, 3); imshow(eleim1); title("Rank3 (Horse 1)");
subplot(2, 2, 4); imshow(eleim2); title("Rank4 (Horse 1)");
pause;

figure;
subplot(2, 2, 1); imshow(horseim2); title("Rank 1 (Horse 2)");
subplot(2, 2, 2); imshow(eleim2); title("Rank 2 (Horse 2)");
subplot(2, 2, 3); imshow(horseim1); title("Rank3 (Horse 2)");
subplot(2, 2, 4); imshow(eleim1); title("Rank4 (Horse 2)");
pause;

figure;
subplot(2, 2, 1); imshow(eleim1); title("Rank 1 (Elephant 1)");
subplot(2, 2, 2); imshow(horseim2); title("Rank 2 (Elephant 1)");
subplot(2, 2, 3); imshow(horseim1); title("Rank3 (Elephant 1)");
subplot(2, 2, 4); imshow(eleim2); title("Rank4 (Elephant 1)");
pause;

figure;
subplot(2, 2, 1); imshow(eleim2); title("Rank 1 (Elephant 2)");
subplot(2, 2, 2); imshow(horseim2); title("Rank 2 (Elephant 2)");
subplot(2, 2, 3); imshow(eleim1); title("Rank3 (Elephant 2)");
subplot(2, 2, 4); imshow(horseim1); title("Rank4 (Elephant 2)");
disp '*** Finish solving 2.2 ***'
pause;

rng(1111);
dwtmode('per');
lenaim = imread('Lena.jpg');
[wmim30, wmim90, nums] = EmbedWatermark(lenaim);

figure;
subplot(1, 3, 1); imshow(lenaim); title("Original");
subplot(1, 3, 2); imshow(wmim30); title("b = 30");
subplot(1, 3, 3); imshow(wmim90); title("b = 90");
disp '*** Finish solving 3.1 ***'
pause;

[wm1, wm2] = ExtractWatermark(wmim30, wmim90);

if isequal(wm1, nums)
    disp 'They are equal for b = 30'
else
    fprintf('They are not equal but the match is %s', sum(wm1 == nums) / length(nums));
end

if isequal(wm2, nums)
    disp 'They are equal for b = 90'
else
    fprintf('They are not equal but the match is %s', sum(wm2 == nums) / length(nums));
end
disp '*** Finish solving 3.2 ***'
pause;
clear all;
close all;
