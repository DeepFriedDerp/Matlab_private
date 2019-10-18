function [tnew,discDerivative] = discreteDeriv(t,data)
    tnew = 0;
    discDerivative = 0;
    for i = 2:(size(data))
        dt = t(i) - t(i-1);
        tnew(i-1) = (dt / 2) + t(i);
        discDerivative(i) = (data(i) - data(i-1)) / dt;
    end
end