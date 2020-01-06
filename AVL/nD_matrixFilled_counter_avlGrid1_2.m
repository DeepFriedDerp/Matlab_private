function [numberEmpty,numberFilled] = nD_matrixFilled_counter_avlGrid1_2(targetMatrix)

	numFill = 0;
	numEmpty = 0;

	for matrixDimiension1 = 1:5
		for matrixDimiension2 = 1:3
			for matrixDimiension3 = 1:20
				for matrixDimiension4 = 1:1
					for matrixDimiension5 = 1:2
						for matrixDimiension6 = 1:2
							for matrixDimiension7 = 1:2
								try
									cLa = targetMatrix(matrixDimiension1, matrixDimiension2, matrixDimiension3, matrixDimiension4, matrixDimiension5, matrixDimiension6, matrixDimiension7).cLa;
								catch
									
                                end
                                if ~isempty(cLa)
                                    numFill = numFill + 1;
                                else
                                    numEmpty = numEmpty + 1;
                                end
							end
						end
					end
				end
			end
		end
    end
    
    numberFilled = numFill;
    numberEmpty = numEmpty;
end