function [sailParams,success] = parseAVLdat(inputFile)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    if ~exist(inputFile)
        error("input file does not exist");
    end

    inputFID = fopen(inputFile,'r');

    got_em = zeros(1,50);

    for lineNum = 1:70
        line = fgetl(inputFID);
        equalsInd = strfind(line,"=");
        vertInd = strfind(line,"|");
        paraInd = strfind(line,"(");

        if (~isempty(equalsInd))
            if (~isempty(vertInd))
                if vertInd(1) > 18 && equalsInd(1) > 0
                    name(1,1) = string(strtrim(extractBefore(line,equalsInd(1))));
                    middle = strtrim(extractAfter(extractBefore(line,equalsInd(2)),equalsInd(1)));
                    val(2,1) = str2double(strtrim(extractAfter(extractBefore(line,vertInd(1)),equalsInd(2))));
                    spaceInd = strfind(middle," ");
                    val(1,1) = str2double(strtrim(extractBefore(middle,spaceInd(1))));
                    name(2,1) = string(strtrim(extractAfter(middle,spaceInd(1))));
                elseif vertInd(1) > 0
                    ind = 1;
                    name(ind,1) = string(strtrim(extractAfter(extractBefore(line,equalsInd(1)),vertInd(1))));
                    if size(equalsInd,2) > 1
                        for i = 2:size(equalsInd,2)
                            ind = ind + 1;
                            middle = strtrim(extractAfter(extractBefore(line,equalsInd(i)),equalsInd(i-1)));
                            spaceInd = strfind(middle," ");
                            val(i - 1,1) = str2double(strtrim(extractBefore(middle,spaceInd(1))));
                            name(i,1) = string(strtrim(extractAfter(middle,spaceInd(1))));
                        end
                    end
                    val(ind,1) = str2double(strtrim(extractAfter(line,equalsInd(size(equalsInd,2)))));
                end
            else
                ind = 1;
                name(ind,1) = string(strtrim(extractBefore(line,equalsInd(1))));
                if size(equalsInd,2) > 1
                    for i = 2:size(equalsInd,2)
                        ind = ind + 1;
                        middle = strtrim(extractAfter(extractBefore(line,equalsInd(i)),equalsInd(i-1)));
                        spaceInd = strfind(middle," ");
                        val(i - 1,1) = str2double(strtrim(extractBefore(middle,spaceInd(1))));
                        name(i,1) = string(strtrim(extractAfter(middle,spaceInd(1))));
                    end
                end
                if ~isempty(paraInd)
                    val(ind,1) = str2double(strtrim(extractAfter(extractBefore(line,paraInd(1)),equalsInd(size(equalsInd,2)))));
                else
                    val(ind,1) = str2double(strtrim(extractAfter(line,equalsInd(size(equalsInd,2)))));
                end
            end


            for j = 1:size(name,1)
                if ~isnan(val(j,1))
                    nameStr = name(j,1);
                    switch nameStr
                        case 'Sref'
                            got_em(1) = 1;
                            sailParams.Sref = val(j,1);
                        case 'Cref'
                            got_em(2) = 1;
                            sailParams.Cref = val(j,1);
                        case 'Bref'
                            got_em(3) = 1;
                            sailParams.Bref = val(j,1);
                        case 'Xref'
                            got_em(4) = 1;
                            sailParams.Xref = val(j,1);
                        case 'Yref'
                            got_em(5) = 1;
                            sailParams.Yref = val(j,1);
                        case 'Zref'
                            got_em(6) = 1;
                            sailParams.Zref = val(j,1);
                        case 'Alpha'
                            got_em(7) = 1;
                            sailParams.alpha = val(j,1);
                        case 'Beta'
                            got_em(8) = 1;
                            sailParams.beta = val(j,1);
                        case 'CDtot'
                            got_em(9) = 1;
                            sailParams.cDtot = val(j,1);
                        case 'e'
                            got_em(10) = 1;
                            sailParams.e = val(j,1);
                        case 'CLa'
                            got_em(11) = 1;
                            sailParams.cLa = val(j,1);
                        case 'CLb'
                            got_em(12) = 1;
                            sailParams.cLb = val(j,1);
                        case 'CYa'
                            got_em(13) = 1;
                            sailParams.cYa = val(j,1);
                        case 'CYb'
                            got_em(14) = 1;
                            sailParams.cYb = val(j,1);
                        case 'Cla'
                            got_em(15) = 1;
                            sailParams.cla = val(j,1);
                        case 'Clb'
                            got_em(16) = 1;
                            sailParams.clb = val(j,1);
                        case 'Cma'
                            got_em(17) = 1;
                            sailParams.cma = val(j,1);
                        case 'Cmb'
                            got_em(18) = 1;
                            sailParams.cmb = val(j,1);
                        case 'Cna'
                            got_em(19) = 1;
                            sailParams.cna = val(j,1);
                        case 'Cnb'
                            got_em(20) = 1;
                            sailParams.cnb = val(j,1);
                        case 'CLp'
                            got_em(21) = 1;
                            sailParams.cLp = val(j,1);
                        case 'CLq'
                            got_em(22) = 1;
                            sailParams.cLq = val(j,1);
                        case 'CLr'
                            got_em(23) = 1;
                            sailParams.cLr = val(j,1);
                        case 'CYp'
                            got_em(24) = 1;
                            sailParams.cYp = val(j,1);
                        case 'CYq'
                            got_em(25) = 1;
                            sailParams.cYq = val(j,1);
                        case 'CYr'
                            got_em(26) = 1;
                            sailParams.cYr = val(j,1);
                        case 'Clp'
                            got_em(27) = 1;
                            sailParams.clp = val(j,1);
                        case 'Clq'
                            got_em(28) = 1;
                            sailParams.clq = val(j,1);
                        case 'Clr'
                            got_em(29) = 1;
                            sailParams.clr = val(j,1);
                        case 'Cmp'
                            got_em(30) = 1;
                            sailParams.cmp = val(j,1);
                        case 'Cmq'
                            got_em(31) = 1;
                            sailParams.cmq = val(j,1);
                        case 'Cmr'
                            got_em(32) = 1;
                            sailParams.cmr = val(j,1);
                        case 'Cnp'
                            got_em(33) = 1;
                            sailParams.cnp = val(j,1);
                        case 'Cnq'
                            got_em(34) = 1;
                            sailParams.cnq = val(j,1);
                        case 'Cnr'
                            got_em(35) = 1;
                            sailParams.cnr = val(j,1);
                        case 'CLd1'
                            got_em(36) = 1;
                            sailParams.cLde = val(j,1);
                        case 'CYd1'
                            got_em(37) = 1;
                            sailParams.cYde = val(j,1);
                        case 'Cld1'
                            got_em(38) = 1;
                            sailParams.clde = val(j,1);
                        case 'Cmd1'
                            got_em(39) = 1;
                            sailParams.cmde = val(j,1);
                        case 'Cnd1'
                            got_em(40) = 1;
                            sailParams.cnde = val(j,1);
                        case 'CDffd1'
                            got_em(41) = 1;
                            sailParams.CDffd1 = val(j,1);
                        case 'ed1'
                            got_em(42) = 1;
                            sailParams.ed1 = val(j,1);
                        case 'Neutral point  Xnp'
                            got_em(43) = 1;
                            sailParams.npX = val(j,1);
                        case 'CLtot'
                            got_em(44) = 1;
                            sailParams.CLtot = val(j,1);
                        case 'CDvis'
                            got_em(45) = 1;
                            sailParams.CDvis = val(j,1);
                        case 'CLff'
                            got_em(46) = 1;
                            sailParams.CLff = val(j,1);
                        case 'CYff'
                            got_em(47) = 1;
                            sailParams.CYff = val(j,1);
                        case 'CDind'
                            got_em(48) = 1;
                            sailParams.CDind = val(j,1);
                        case 'CDff'
                            got_em(49) = 1;
                            sailParams.CDff = val(j,1);
                        case 'Clb Cnr / Clr Cnb'
                            got_em(50) = 1;
                            sailParams.Clnbr_ratio = val(j,1);
                    end
                end
            end
        end
    end

    got_em_all = 1;
    for i = 1:50
        got_em_all = (got_em_all && got_em(i));
    end

    if got_em_all == 1
        success = 1;
    else
        success = 0;
    end
          
end

