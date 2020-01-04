clear all;

if exist('newGridFill_Current.mat','file')
    load newGridFill_Current
    newMatrix = resultsNew;
elseif exist('GridFill_Attempt_122119.mat','file')
    load GridFill_Attempt_122119
    newMatrix = resultsNew;
elseif exist('res9.mat','file')
    load res9
    newMatrix = results;
else
    error("none of the hard-coded files are on the path")
end

gapsFilled = 1;
functionCalls_fillGridGaps2 = 0;

while gapsFilled > 0 && (functionCalls_fillGridGaps2 < 19000)
    functionCalls_fillGridGaps2 = functionCalls_fillGridGaps2 + 1;
    [newMatrix,gapsFilled] = fillGridGaps_2(newMatrix,settings);
end

save newGridFill_final