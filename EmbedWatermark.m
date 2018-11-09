function [im1, im2, nums] = EmbedWatermark(inputim)
    [c, s] = wavedec2(inputim, 3, 'db9');
    
    nums = randi([0 1], 1, s(1) * s(2));
        
    im1 = Watermark(c,s,nums,30);
    im2 = Watermark(c,s,nums,90);
end

function im = Watermark(cin, s, nums, b)
    c = cin;
    for i=1:s(1)*s(2)
        if nums(i) == 0
           if mod(c(i),b) <= .75*b
               c(i) = c(i) - mod(c(i), b) + (.25*b);
           else
               c(i) = (c(i) + (.5*b)) - mod(c(i)-(.5*b),b) + (.25*b);
           end
        else
            if mod(c(i), b) >= .25*b
                c(i) = c(i) - mod(c(i), b) + (.75*b);
            else
                c(i) = (c(i) - (.25*b)) - mod(c(i)-(.25*b),b) + (.75*b);
            end
        end
    end
    im = uint8(waverec2(c,s,'db9'));
end

