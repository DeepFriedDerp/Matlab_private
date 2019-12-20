function [isOutside] = outsideBoundsCheck(val, val_min, val_max)
    isOutside = 0;
    
    if val > val_max
        isOutside = 1;
        return;
    elseif val <= val_min
        isOutside = 1;
        return;
    end
end