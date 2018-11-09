function hist = CalNormalizedHSVHist(inputim, hbinnum, sbinnum, vbinnum)

    hist = zeros(1, hbinnum * sbinnum * vbinnum);
    hsvim = rgb2hsv(inputim);
    hvals = floor(hsvim(:,:,1) * 255);
    svals = floor(hsvim(:,:,2) * 255);
    vvals = floor(hsvim(:,:,3) * 255);
    
    [rows, cols] = size(hvals);
    hbinr = floor(255 / hbinnum) + 1;
    sbinr = floor(255 / sbinnum) + 1;
    vbinr = floor(255 / vbinnum) + 1;
    
    for i=1:rows
        for j=1:cols
            hbin = floor(hvals(i,j) / hbinr);
            sbin = floor(svals(i,j) / sbinr);
            vbin = floor(vvals(i,j) / vbinr);
            
            histnum = (vbinnum * sbinnum * hbin) + (vbinnum * sbin) + vbin + 1;
            hist(histnum) = hist(histnum) + 1;
        end
    end
end

