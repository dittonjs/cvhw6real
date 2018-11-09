function similarity = CalSimilarity(hist1, hist2)
    total = 0;
    mag1 = sum(hist1);
    mag2 = sum(hist2);
    % assumes the same length
    for i=1:length(hist1)
        total = total + (min(hist1(i) * mag1, hist2(i) * mag2) / min(mag1, mag2)); % makes this a percentage
    end
    similarity = total / min(mag1, mag2);
end

