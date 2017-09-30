function [ r ] = sigma( PSF )    
        r=sqrt(1/(2*pi*max(max(PSF))));
        if r==Inf
            r=2.5;
        end
end

