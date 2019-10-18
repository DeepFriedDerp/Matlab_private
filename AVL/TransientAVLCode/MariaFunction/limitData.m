function [newData] = limitData(oldData,abslimit);
    newData = 0;
    for i = 1:size(oldData)
        if abs(oldData(i)) > abslimit
            if oldData(i) > 0
                newData = abslimit;
            else
                newData = -abslimit;
            end
        end
    end
end