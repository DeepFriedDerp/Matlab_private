breakFlag = 0;

for i = 1:9
if breakFlag > 0
    break;
end
    for j = 1:9
        if breakFlag > 0
            break;
        end
        for k = 1:9
            if breakFlag > 0
                break;
            end
            sprintf("%.0f%.0f%.0f\n",i,j,k)
            if j > 4
                breakFlag = 1;
            end
        end
    end
end
