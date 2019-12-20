function status = SailOutputFcn_Model(t,x,flag)

    global otherstuff currentConfig aeroTriggers ...
        aeroTriggersLast settings results ...
        cL_a cL_b cL_de cL_p cL_q cL_r ...
        cD_tot...
        cY_a cY_b cY_de cY_p cY_q cY_r ...
        cl_a cl_b cl_de cl_p cl_q cl_r ...
        cm_a cm_b cm_de cm_p cm_q cm_r ...
        cn_a cn_b cn_de cn_p cn_q cn_r ...
        vWO_X vWO_Y vWO_Z de stallFlag callNum xtemp windstatesTemp...
        ;
    if ~exist(flag,'var')
        flag = '0';
    end
    if strcmp(flag,'done')
        status = 0;
        return;
    end
    
	if strcmp(flag,'init')
		stallFlag = 0;
		callNum = 0;
		settings = otherstuff.settings;
		results = otherstuff.results;
		de = otherstuff.de;
		vWO_X = otherstuff.vWO_X;
		vWO_Y = otherstuff.vWO_Y;
		vWO_Z = otherstuff.vWO_Z;
    end
    
    alpha = atan2(x(9) + x(2)*x(10) - vWO_X*(cos(x(4))*sin(x(5)) + cos(x(5))*sin(x(4))*sin(x(6))) - vWO_Z*(cos(x(4))*cos(x(5)) - sin(x(4))*sin(x(5))*sin(x(6))) - x(1)*x(12)*sin(x(4)) + x(2)*x(11)*sin(x(6)) + vWO_Y*cos(x(6))*sin(x(4)) - x(1)*x(11)*cos(x(4))*cos(x(6)), x(7) - x(2)*(x(12)*cos(x(4)) - x(11)*cos(x(6))*sin(x(4))) + x(3)*(x(12)*sin(x(4)) + x(11)*cos(x(4))*cos(x(6))) - vWO_Y*sin(x(6)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Z*cos(x(6))*sin(x(5)));
	beta = atan2(x(3)*x(10) - x(8) + vWO_X*(sin(x(4))*sin(x(5)) - cos(x(4))*cos(x(5))*sin(x(6))) + vWO_Z*(cos(x(5))*sin(x(4)) + cos(x(4))*sin(x(5))*sin(x(6))) - x(1)*x(12)*cos(x(4)) + x(3)*x(11)*sin(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)), x(7) - x(2)*(x(12)*cos(x(4)) - x(11)*cos(x(6))*sin(x(4))) + x(3)*(x(12)*sin(x(4)) + x(11)*cos(x(4))*cos(x(6))) - vWO_Y*sin(x(6)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Z*cos(x(6))*sin(x(5)));
	windspeed = (abs(x(3)*x(10) - x(8) + vWO_X*(sin(x(4))*sin(x(5)) - cos(x(4))*cos(x(5))*sin(x(6))) + vWO_Z*(cos(x(5))*sin(x(4)) + cos(x(4))*sin(x(5))*sin(x(6))) - x(1)*x(12)*cos(x(4)) + x(3)*x(11)*sin(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)))^2 + abs(vWO_X*(cos(x(4))*sin(x(5)) + cos(x(5))*sin(x(4))*sin(x(6))) - x(2)*x(10) - x(9) + vWO_Z*(cos(x(4))*cos(x(5)) - sin(x(4))*sin(x(5))*sin(x(6))) + x(1)*x(12)*sin(x(4)) - x(2)*x(11)*sin(x(6)) - vWO_Y*cos(x(6))*sin(x(4)) + x(1)*x(11)*cos(x(4))*cos(x(6)))^2 + abs(x(2)*(x(12)*cos(x(4)) - x(11)*cos(x(6))*sin(x(4))) - x(7) - x(3)*(x(12)*sin(x(4)) + x(11)*cos(x(4))*cos(x(6))) + vWO_Y*sin(x(6)) + vWO_X*cos(x(5))*cos(x(6)) - vWO_Z*cos(x(6))*sin(x(5)))^2)^(1/2);
	p = - x(10) - x(11)*sin(x(6));
	q = x(12)*sin(x(4)) + x(11)*cos(x(4))*cos(x(6));
	r = x(11)*cos(x(6))*sin(x(4)) - x(12)*cos(x(4));
    
    if ~strcmp(flag,'init')
        callNum = callNum + 1;
        try
            xtemp(callNum,:) = [[t(1)],[x]];
            windstatesTemp(callNum,:) = [t(1),alpha,beta,windspeed,p,q,r];
        catch
            t(1)
            x
        end
    end
    
    currentConfig.alpha = alpha;
	currentConfig.beta = beta;
	currentConfig.de = de;
	currentConfig.windspeed = windspeed;
	currentConfig.p = p;
	currentConfig.q = q;
	currentConfig.r = r;
    
    if strcmp(flag,'init')
        findAeroFlag = 1;
    elseif ~stallFlag
		[findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);
    else
        findAeroFlag = 0;
    end
    
    if findAeroFlag || stallFlag
		[successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig( ...
			settings,currentConfig);
		if successFindAero
			aeroTriggersLast = aeroTriggers;
			stallFlag = 0;

			cL_a = results(resultsCoords).cLa;
			cL_b = results(resultsCoords).cLb;
			cL_de = results(resultsCoords).cLde;
			cL_p = results(resultsCoords).cLp;
			cL_q = results(resultsCoords).cLq;
			cL_r = results(resultsCoords).cLr;

			cD_tot = results(resultsCoords).cDtot;

			cY_a = results(resultsCoords).cYa;
			cY_b = results(resultsCoords).cYb;
			cY_de = results(resultsCoords).cYde;
			cY_p = results(resultsCoords).cYp;
			cY_q = results(resultsCoords).cYq;
			cY_r = results(resultsCoords).cYr;

			cl_a = results(resultsCoords).cla;
			cl_b = results(resultsCoords).clb;
			cl_de = results(resultsCoords).clde;
			cl_p = results(resultsCoords).clp;
			cl_q = results(resultsCoords).clq;
			cl_r = results(resultsCoords).clr;

			cm_a = results(resultsCoords).cma;
			cm_b = results(resultsCoords).cmb;
			cm_de = results(resultsCoords).cmde;
			cm_p = results(resultsCoords).cmp;
			cm_q = results(resultsCoords).cmq;
			cm_r = results(resultsCoords).cmr;

			cn_a = results(resultsCoords).cna;
			cn_b = results(resultsCoords).cnb;
			cn_de = results(resultsCoords).cnde;
			cn_p = results(resultsCoords).cnp;
			cn_q = results(resultsCoords).cnq;
			cn_r = results(resultsCoords).cnr;

        else
            stallFlag = 1;
            if strcmp(flag,'init')
                
                resultDims = size(results);
                resultDefault_coords = round(resultDims/2);
                
                cL_a = results(resultDefault_coords).cLa;
                cL_b = results(resultDefault_coords).cLb;
                cL_de = results(resultDefault_coords).cLde;
                cL_p = results(resultDefault_coords).cLp;
                cL_q = results(resultDefault_coords).cLq;
                cL_r = results(resultDefault_coords).cLr;

                cD_tot = results(resultDefault_coords).cDtot;

                cY_a = results(resultDefault_coords).cYa;
                cY_b = results(resultDefault_coords).cYb;
                cY_de = results(resultDefault_coords).cYde;
                cY_p = results(resultDefault_coords).cYp;
                cY_q = results(resultDefault_coords).cYq;
                cY_r = results(resultDefault_coords).cYr;

                cl_a = results(resultDefault_coords).cla;
                cl_b = results(resultDefault_coords).clb;
                cl_de = results(resultDefault_coords).clde;
                cl_p = results(resultDefault_coords).clp;
                cl_q = results(resultDefault_coords).clq;
                cl_r = results(resultDefault_coords).clr;

                cm_a = results(resultDefault_coords).cma;
                cm_b = results(resultDefault_coords).cmb;
                cm_de = results(resultDefault_coords).cmde;
                cm_p = results(resultDefault_coords).cmp;
                cm_q = results(resultDefault_coords).cmq;
                cm_r = results(resultDefault_coords).cmr;

                cn_a = results(resultDefault_coords).cna;
                cn_b = results(resultDefault_coords).cnb;
                cn_de = results(resultDefault_coords).cnde;
                cn_p = results(resultDefault_coords).cnp;
                cn_q = results(resultDefault_coords).cnq;
                cn_r = results(resultDefault_coords).cnr;
			
            end
		end
    end
    status = 0;
end