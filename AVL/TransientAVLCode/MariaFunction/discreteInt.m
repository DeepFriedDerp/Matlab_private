function [tnew,disIntegral] = discreteInt(t,data)
    tnew(1) = t(1) - (((t(2) - t(1)) / 2));
    disIntegral(1) = 0;
    
    for i = 1 : size(data)
        tnew(i+1) = ((t(i+1) - t(i))/ 2);
        dt = tnew(i+1) - tnew(i);
        dr = data(i);
        disIntegral(i+1) = disIntegral(i) + (dr * dt);
    end
end