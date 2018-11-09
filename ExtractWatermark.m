function [wm1, wm2] = ExtractWatermark(inputim1, inputim2)
    [c1, s1] = wavedec2(inputim1, 3, 'db9');
    [c2, s2] = wavedec2(inputim2, 3, 'db9');
    wm1 = BuildWatermark(c1,s1,30);
    wm2 = BuildWatermark(c2,s2,90);
end

function wm = BuildWatermark(c, s, b)
    wm = zeros(1, s(1)*s(2));
    for i=1:s(1)*s(2)
        if mod(c(i),b) > b/2
            wm(i) = 1;
        else
            wm(i) = 0;
        end
    end
end
