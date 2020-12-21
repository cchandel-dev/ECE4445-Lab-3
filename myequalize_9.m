function im2 = myequalize_9(im)
    im2 = im;
    %Store histogram data into 'h'
    h = imhist(im);
    
    %Calculate final cumulative sum
    A0 = sum(h);
    
    %Replace 'h' vector with cumulative sum vector
    h = cumsum(h);
    
    %Discretizing f(Da)
    d = zeros(256,1);
    for i=1:256
        d(i) = double(h(i)/A0)*255;
        d(i) = round(d(i));
    end
    
    %Redistributing with equalized resolution
    for i=1:256
        im2(im == i) = d(i);
    end