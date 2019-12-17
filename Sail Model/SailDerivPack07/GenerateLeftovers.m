function GenerateLeftovers(solutionsFolder,solutionsMatFile,resMatFile)

	load(resMatFile);
	cd(solutionsFolder);
	load(solutionsMatFile);
	cd ..;
	iter_max = size(t);

	global otherstuff 
	persistent currentConfig aeroTriggers aeroTriggersLast ...
	cL_a cL_b cL_de cL_p cL_q cL_r ...
	cD_tot...
	cY_a cY_b cY_de cY_p cY_q cY_r ...
	cl_a cl_b cl_de cl_p cl_q cl_r ...
	cm_a cm_b cm_de cm_p cm_q cm_r ...
	cn_a cn_b cn_de cn_p cn_q cn_r ...
	stallFlag ...
	;

	results = resultsNew;

	findAeroFlag = 1;
		if t == 0
		stallFlag = 0;
		callNum = 0;
		settings = otherstuff.settings;
		results = otherstuff.results;
		de = otherstuff.de;
		vWO_X = otherstuff.vWO_X;
		vWO_Y = otherstuff.vWO_Y;
		vWO_Z = otherstuff.vWO_Z;
	end

	for i = 1:iter_max
		xderp(:) = x(i,:);
		tderp = t(i);

		alpha = atan2(xderp(9) + xderp(2)*xderp(10) - vWO_X*(cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6))) - vWO_Z*(cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6))) - xderp(1)*xderp(12)*sin(xderp(4)) + xderp(2)*xderp(11)*sin(xderp(6)) + vWO_Y*cos(xderp(6))*sin(xderp(4)) - xderp(1)*xderp(11)*cos(xderp(4))*cos(xderp(6)), xderp(7) - xderp(2)*(xderp(12)*cos(xderp(4)) - xderp(11)*cos(xderp(6))*sin(xderp(4))) + xderp(3)*(xderp(12)*sin(xderp(4)) + xderp(11)*cos(xderp(4))*cos(xderp(6))) - vWO_Y*sin(xderp(6)) - vWO_X*cos(xderp(5))*cos(xderp(6)) + vWO_Z*cos(xderp(6))*sin(xderp(5)));
		beta = atan2(xderp(3)*xderp(10) - xderp(8) + vWO_X*(sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6))) + vWO_Z*(cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6))) - xderp(1)*xderp(12)*cos(xderp(4)) + xderp(3)*xderp(11)*sin(xderp(6)) + vWO_Y*cos(xderp(4))*cos(xderp(6)) + xderp(1)*xderp(11)*cos(xderp(6))*sin(xderp(4)), xderp(7) - xderp(2)*(xderp(12)*cos(xderp(4)) - xderp(11)*cos(xderp(6))*sin(xderp(4))) + xderp(3)*(xderp(12)*sin(xderp(4)) + xderp(11)*cos(xderp(4))*cos(xderp(6))) - vWO_Y*sin(xderp(6)) - vWO_X*cos(xderp(5))*cos(xderp(6)) + vWO_Z*cos(xderp(6))*sin(xderp(5)));
		windspeed = (abs(xderp(3)*xderp(10) - xderp(8) + vWO_X*(sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6))) + vWO_Z*(cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6))) - xderp(1)*xderp(12)*cos(xderp(4)) + xderp(3)*xderp(11)*sin(xderp(6)) + vWO_Y*cos(xderp(4))*cos(xderp(6)) + xderp(1)*xderp(11)*cos(xderp(6))*sin(xderp(4)))^2 + abs(vWO_X*(cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6))) - xderp(2)*xderp(10) - xderp(9) + vWO_Z*(cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6))) + xderp(1)*xderp(12)*sin(xderp(4)) - xderp(2)*xderp(11)*sin(xderp(6)) - vWO_Y*cos(xderp(6))*sin(xderp(4)) + xderp(1)*xderp(11)*cos(xderp(4))*cos(xderp(6)))^2 + abs(xderp(2)*(xderp(12)*cos(xderp(4)) - xderp(11)*cos(xderp(6))*sin(xderp(4))) - xderp(7) - xderp(3)*(xderp(12)*sin(xderp(4)) + xderp(11)*cos(xderp(4))*cos(xderp(6))) + vWO_Y*sin(xderp(6)) + vWO_X*cos(xderp(5))*cos(xderp(6)) - vWO_Z*cos(xderp(6))*sin(xderp(5)))^2)^(1/2);
		p = - xderp(10) - xderp(11)*sin(xderp(6));
		q = xderp(12)*sin(xderp(4)) + xderp(11)*cos(xderp(4))*cos(xderp(6));
		r = xderp(11)*cos(xderp(6))*sin(xderp(4)) - xderp(12)*cos(xderp(4));
		Tx = -((xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*((75*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2))/2 + (2*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*(xderp(8) - (762*xderp(10)*cos(xderp(4))*cos(xderp(5)))/5 + (762*xderp(11)*sin(xderp(4))*sin(xderp(5)))/5 - (762*xderp(11)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))/5 - (762*xderp(12)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)))/5 + (762*xderp(10)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5) + 2*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*(xderp(9) + (762*xderp(10)*cos(xderp(5))*sin(xderp(4)))/5 + (762*xderp(11)*cos(xderp(4))*sin(xderp(5)))/5 + (762*xderp(10)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + (762*xderp(11)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))/5 + (762*xderp(12)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)))/5) + 2*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*(xderp(7) + (762*xderp(11)*cos(xderp(5))*cos(xderp(6)))/5 - (762*xderp(12)*sin(xderp(5))*sin(xderp(6)))/5))/(4*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2)) - 399408529166665125/140737488355328))/(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2);
		Ty = -(((75*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2))/2 + (2*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*(xderp(8) - (762*xderp(10)*cos(xderp(4))*cos(xderp(5)))/5 + (762*xderp(11)*sin(xderp(4))*sin(xderp(5)))/5 - (762*xderp(11)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))/5 - (762*xderp(12)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)))/5 + (762*xderp(10)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5) + 2*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*(xderp(9) + (762*xderp(10)*cos(xderp(5))*sin(xderp(4)))/5 + (762*xderp(11)*cos(xderp(4))*sin(xderp(5)))/5 + (762*xderp(10)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + (762*xderp(11)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))/5 + (762*xderp(12)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)))/5) + 2*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*(xderp(7) + (762*xderp(11)*cos(xderp(5))*cos(xderp(6)))/5 - (762*xderp(12)*sin(xderp(5))*sin(xderp(6)))/5))/(4*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2)) - 399408529166665125/140737488355328)*(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000))/(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2);
		Tz = -(((75*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2))/2 + (2*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*(xderp(8) - (762*xderp(10)*cos(xderp(4))*cos(xderp(5)))/5 + (762*xderp(11)*sin(xderp(4))*sin(xderp(5)))/5 - (762*xderp(11)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))/5 - (762*xderp(12)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)))/5 + (762*xderp(10)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5) + 2*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*(xderp(9) + (762*xderp(10)*cos(xderp(5))*sin(xderp(4)))/5 + (762*xderp(11)*cos(xderp(4))*sin(xderp(5)))/5 + (762*xderp(10)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + (762*xderp(11)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))/5 + (762*xderp(12)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)))/5) + 2*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*(xderp(7) + (762*xderp(11)*cos(xderp(5))*cos(xderp(6)))/5 - (762*xderp(12)*sin(xderp(5))*sin(xderp(6)))/5))/(4*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2)) - 399408529166665125/140737488355328)*(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000))/(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2);
		d_tether = (abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2) - 5325447055555535/70368744177664;

		if d_tether <= 0
			Tx = 0;
			Ty = 0;
			Tz = 0;
		end

		currentConfig.alpha = alpha;
		currentConfig.beta = beta;
		currentConfig.de = de;
		currentConfig.windspeed = windspeed;
		currentConfig.p = p;
		currentConfig.q = q;
		currentConfig.r = r;

		if tderp == 0
			findAeroFlag = 1;
		elseif ~stallFlag
			[findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);
		end

		if findAeroFlag || stallFlag
			[successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig(settings,currentConfig);
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

			end
		end

		rCB_x_B = 0;
		rCB_y_B = 0;
		rCB_z_B = 0;
		CL_s = alpha*cL_a + beta*cL_b + cL_de*de - cL_p*xderp(10) - cL_r*xderp(12)*cos(xderp(4)) - cL_p*xderp(11)*sin(xderp(6)) + cL_q*xderp(12)*sin(xderp(4)) + cL_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cL_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		CD_s = cD_tot;
		CY_s = alpha*cY_a + beta*cY_b + cY_de*de - cY_p*xderp(10) - cY_r*xderp(12)*cos(xderp(4)) - cY_p*xderp(11)*sin(xderp(6)) + cY_q*xderp(12)*sin(xderp(4)) + cY_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cY_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cl_s = alpha*cl_a + beta*cl_b + cl_de*de - cl_p*xderp(10) - cl_r*xderp(12)*cos(xderp(4)) - cl_p*xderp(11)*sin(xderp(6)) + cl_q*xderp(12)*sin(xderp(4)) + cl_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cl_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cm_s = alpha*cm_a + beta*cm_b + cm_de*de - cm_p*xderp(10) - cm_r*xderp(12)*cos(xderp(4)) - cm_p*xderp(11)*sin(xderp(6)) + cm_q*xderp(12)*sin(xderp(4)) + cm_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cm_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cn_s = alpha*cn_a + beta*cn_b + cn_de*de - cn_p*xderp(10) - cn_r*xderp(12)*cos(xderp(4)) - cn_p*xderp(11)*sin(xderp(6)) + cn_q*xderp(12)*sin(xderp(4)) + cn_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cn_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		rGO_x_B = -(762*cos(xderp(6))*sin(xderp(5)))/5;
		rGO_y_B = (762*cos(xderp(5))*sin(xderp(4)))/5 + (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5;
		rGO_z_B = (762*cos(xderp(4))*cos(xderp(5)))/5 - (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5;
		rGP_x_B = - xderp(1) - (762*cos(xderp(6))*sin(xderp(5)))/5;
		rGP_y_B = (762*cos(xderp(5))*sin(xderp(4)))/5 - xderp(2) + (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 - 10059/25000;
		rGP_z_B = (762*cos(xderp(4))*cos(xderp(5)))/5 - xderp(3) - (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 - 63/100000;

		Q = 0.5 * 1.225 * windspeed * windspeed;

		L_S = CL_s * Q * 0.4;
		D_S = CD_s * Q * 0.4;
		Y_S = CY_s * Q * 0.4;
		l_S = Cl_s * Q * 0.4 * 1.4;
		m_S = Cm_s * Q * 0.4 * 0.3;
		n_S = Cn_s * Q * 0.4 * 1.4;

		rPB_x_B = 0;
		rPB_y_B = 10059/25000;
		rPB_z_B = 63/100000;
		rBQ_x_B = -58123/100000;
		rBQ_y_B = -10059/25000;
		rBQ_z_B = -63/100000;
		rPQ_x_B = -58123/100000;
		rPQ_y_B = 0;
		rPQ_z_B = 0;
		T_x_O = -((63*cos(xderp(4))*sin(xderp(5)) + 40236*sin(xderp(4))*sin(xderp(5)) - 40236*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)) + 63*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)) - 15240000*cos(xderp(4))^2*cos(xderp(5))*sin(xderp(5)) + 15240000*cos(xderp(5))*cos(xderp(6))^2*sin(xderp(5)) - 15240000*cos(xderp(5))*sin(xderp(4))^2*sin(xderp(5)) + 100000*xderp(1)*cos(xderp(5))*cos(xderp(6)) + 100000*xderp(3)*cos(xderp(4))*sin(xderp(5)) + 100000*xderp(2)*sin(xderp(4))*sin(xderp(5)) - 100000*xderp(2)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)) + 100000*xderp(3)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)) + 15240000*cos(xderp(4))^2*cos(xderp(5))*sin(xderp(5))*sin(xderp(6))^2 + 15240000*cos(xderp(5))*sin(xderp(4))^2*sin(xderp(5))*sin(xderp(6))^2)*(26388279066624000*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 - 1997042645833325625*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2) + 26388279066624000*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + 26388279066624000*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2 + 351843720888320*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(7) + 351843720888320*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(8)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000) + 351843720888320*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(9)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000) + 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(11)*cos(xderp(5))*cos(xderp(6)) - 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(12)*sin(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(12)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(12)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6))))/(70368744177664000000*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2));
		T_y_O = -((40236*cos(xderp(4))*cos(xderp(6)) - 63*cos(xderp(6))*sin(xderp(4)) + 100000*xderp(1)*sin(xderp(6)) + 15240000*cos(xderp(6))*sin(xderp(5))*sin(xderp(6)) + 100000*xderp(2)*cos(xderp(4))*cos(xderp(6)) - 100000*xderp(3)*cos(xderp(6))*sin(xderp(4)) - 15240000*cos(xderp(4))^2*cos(xderp(6))*sin(xderp(5))*sin(xderp(6)) - 15240000*cos(xderp(6))*sin(xderp(4))^2*sin(xderp(5))*sin(xderp(6)))*(26388279066624000*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 - 1997042645833325625*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2) + 26388279066624000*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + 26388279066624000*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2 + 351843720888320*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(7) + 351843720888320*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(8)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000) + 351843720888320*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(9)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000) + 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(11)*cos(xderp(5))*cos(xderp(6)) - 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(12)*sin(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(12)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(12)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6))))/(70368744177664000000*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2));
		T_z_O = ((15240000*cos(xderp(4))^2*cos(xderp(5))^2 - 40236*cos(xderp(5))*sin(xderp(4)) - 63*cos(xderp(4))*cos(xderp(5)) + 15240000*cos(xderp(5))^2*sin(xderp(4))^2 + 15240000*cos(xderp(6))^2*sin(xderp(5))^2 - 40236*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 63*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 15240000*cos(xderp(4))^2*sin(xderp(5))^2*sin(xderp(6))^2 + 15240000*sin(xderp(4))^2*sin(xderp(5))^2*sin(xderp(6))^2 - 100000*xderp(3)*cos(xderp(4))*cos(xderp(5)) - 100000*xderp(2)*cos(xderp(5))*sin(xderp(4)) + 100000*xderp(1)*cos(xderp(6))*sin(xderp(5)) - 100000*xderp(2)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 100000*xderp(3)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))*(26388279066624000*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 - 1997042645833325625*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2)^(1/2) + 26388279066624000*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + 26388279066624000*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2 + 351843720888320*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(7) + 351843720888320*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(8)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000) + 351843720888320*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(9)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000) + 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(11)*cos(xderp(5))*cos(xderp(6)) - 53620983063379968*abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*sign(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)*xderp(12)*sin(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(11)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)) - 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(12)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*cos(xderp(4))*cos(xderp(6))*sin(xderp(5)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(10)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(11)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)) + 53620983063379968*abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*xderp(12)*sign(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)*cos(xderp(6))*sin(xderp(4))*sin(xderp(5)) + 53620983063379968*abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*xderp(10)*sign(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)*sin(xderp(4))*sin(xderp(5))*sin(xderp(6))))/(70368744177664000000*(abs(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5)^2 + abs(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000)^2 + abs(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000)^2));
		rBO_x_O = xderp(2)*(sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6))) + xderp(3)*(cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6))) + xderp(1)*cos(xderp(5))*cos(xderp(6));
		rBO_y_O = xderp(1)*sin(xderp(6)) + xderp(2)*cos(xderp(4))*cos(xderp(6)) - xderp(3)*cos(xderp(6))*sin(xderp(4));
		rBO_z_O = xderp(2)*(cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6))) + xderp(3)*(cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6))) - xderp(1)*cos(xderp(6))*sin(xderp(5));
		rPB_x_O = (63*cos(xderp(4))*sin(xderp(5)))/100000 + (10059*sin(xderp(4))*sin(xderp(5)))/25000 - (10059*cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))/25000 + (63*cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))/100000;
		rPB_y_O = (21*cos(xderp(6))*(1916*cos(xderp(4)) - 3*sin(xderp(4))))/100000;
		rPB_z_O = (63*cos(xderp(4))*cos(xderp(5)))/100000 + (10059*cos(xderp(5))*sin(xderp(4)))/25000 + (10059*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/25000 - (63*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/100000;
		rGO_x_O = 0;
		rGO_y_O = 0;
		rGO_z_O = 762/5;
		rGP_x_O = - (sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))*(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000) - (cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))*(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000) - cos(xderp(5))*cos(xderp(6))*(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5);
		rGP_y_O = (63*cos(xderp(6))*sin(xderp(4)))/100000 - (10059*cos(xderp(4))*cos(xderp(6)))/25000 - xderp(1)*sin(xderp(6)) - xderp(2)*cos(xderp(4))*cos(xderp(6)) + xderp(3)*cos(xderp(6))*sin(xderp(4));
		rGP_z_O = cos(xderp(6))*sin(xderp(5))*(xderp(1) + (762*cos(xderp(6))*sin(xderp(5)))/5) - (cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))*(xderp(3) - (762*cos(xderp(4))*cos(xderp(5)))/5 + (762*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 63/100000) - (cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))*(xderp(2) - (762*cos(xderp(5))*sin(xderp(4)))/5 - (762*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/5 + 10059/25000);
		Fg_x_B = (1953171*cos(xderp(6))*sin(xderp(5)))/100000;
		Fg_y_B = - (1953171*cos(xderp(5))*sin(xderp(4)))/100000 - (1953171*cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))/100000;
		Fg_z_B = (1953171*sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))/100000 - (1953171*cos(xderp(4))*cos(xderp(5)))/100000;
		CD_s = cD_tot;
		CY_s = alpha*cY_a + beta*cY_b + cY_de*de - cY_p*xderp(10) - cY_r*xderp(12)*cos(xderp(4)) - cY_p*xderp(11)*sin(xderp(6)) + cY_q*xderp(12)*sin(xderp(4)) + cY_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cY_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		CL_s = alpha*cL_a + beta*cL_b + cL_de*de - cL_p*xderp(10) - cL_r*xderp(12)*cos(xderp(4)) - cL_p*xderp(11)*sin(xderp(6)) + cL_q*xderp(12)*sin(xderp(4)) + cL_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cL_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cl_s = alpha*cl_a + beta*cl_b + cl_de*de - cl_p*xderp(10) - cl_r*xderp(12)*cos(xderp(4)) - cl_p*xderp(11)*sin(xderp(6)) + cl_q*xderp(12)*sin(xderp(4)) + cl_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cl_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cm_s = alpha*cm_a + beta*cm_b + cm_de*de - cm_p*xderp(10) - cm_r*xderp(12)*cos(xderp(4)) - cm_p*xderp(11)*sin(xderp(6)) + cm_q*xderp(12)*sin(xderp(4)) + cm_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cm_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		Cn_s = alpha*cn_a + beta*cn_b + cn_de*de - cn_p*xderp(10) - cn_r*xderp(12)*cos(xderp(4)) - cn_p*xderp(11)*sin(xderp(6)) + cn_q*xderp(12)*sin(xderp(4)) + cn_r*xderp(11)*cos(xderp(6))*sin(xderp(4)) + cn_q*xderp(11)*cos(xderp(4))*cos(xderp(6));
		D_O = (49*CY_s*windspeed^2*(sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6))))/200 - (49*windspeed^2*(CL_s*cos(alpha) + CD_s*sin(alpha))*(cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6))))/200 - (49*windspeed^2*cos(xderp(5))*cos(xderp(6))*(CD_s*cos(alpha) - CL_s*sin(alpha)))/200;
		Y_O = (49*CY_s*windspeed^2*cos(xderp(4))*cos(xderp(6)))/200 - (49*windspeed^2*sin(xderp(6))*(CD_s*cos(alpha) - CL_s*sin(alpha)))/200 + (49*windspeed^2*cos(xderp(6))*sin(xderp(4))*(CL_s*cos(alpha) + CD_s*sin(alpha)))/200;
		L_O = (49*CY_s*windspeed^2*(cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6))))/200 - (49*windspeed^2*(CL_s*cos(alpha) + CD_s*sin(alpha))*(cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6))))/200 + (49*windspeed^2*cos(xderp(6))*sin(xderp(5))*(CD_s*cos(alpha) - CL_s*sin(alpha)))/200;
		l_O = (49*windspeed^2*(sin(xderp(4))*sin(xderp(5)) - cos(xderp(4))*cos(xderp(5))*sin(xderp(6)))*((17*Cm_s)/2 - (11*Cm_s*(2*cos(beta)^2 - 1))/2 + 11*Cl_s*cos(beta)*sin(beta)))/2000 - (49*windspeed^2*(cos(xderp(4))*sin(xderp(5)) + cos(xderp(5))*sin(xderp(4))*sin(xderp(6)))*(14*Cn_s*cos(alpha) + 3*Cl_s*sin(alpha) + 11*Cl_s*cos(beta)^2*sin(alpha) + 11*Cm_s*cos(beta)*sin(alpha)*sin(beta)))/2000 - (49*windspeed^2*cos(xderp(5))*cos(xderp(6))*(3*Cl_s*cos(alpha) - 14*Cn_s*sin(alpha) + 11*Cl_s*cos(alpha)*cos(beta)^2 + 11*Cm_s*cos(alpha)*cos(beta)*sin(beta)))/2000;
		m_O = (49*windspeed^2*cos(xderp(4))*cos(xderp(6))*((17*Cm_s)/2 - (11*Cm_s*(2*cos(beta)^2 - 1))/2 + 11*Cl_s*cos(beta)*sin(beta)))/2000 - (49*windspeed^2*sin(xderp(6))*(3*Cl_s*cos(alpha) - 14*Cn_s*sin(alpha) + 11*Cl_s*cos(alpha)*cos(beta)^2 + 11*Cm_s*cos(alpha)*cos(beta)*sin(beta)))/2000 + (49*windspeed^2*cos(xderp(6))*sin(xderp(4))*(14*Cn_s*cos(alpha) + 3*Cl_s*sin(alpha) + 11*Cl_s*cos(beta)^2*sin(alpha) + 11*Cm_s*cos(beta)*sin(alpha)*sin(beta)))/2000;
		n_O = (49*windspeed^2*(cos(xderp(5))*sin(xderp(4)) + cos(xderp(4))*sin(xderp(5))*sin(xderp(6)))*((17*Cm_s)/2 - (11*Cm_s*(2*cos(beta)^2 - 1))/2 + 11*Cl_s*cos(beta)*sin(beta)))/2000 - (49*windspeed^2*(cos(xderp(4))*cos(xderp(5)) - sin(xderp(4))*sin(xderp(5))*sin(xderp(6)))*(14*Cn_s*cos(alpha) + 3*Cl_s*sin(alpha) + 11*Cl_s*cos(beta)^2*sin(alpha) + 11*Cm_s*cos(beta)*sin(alpha)*sin(beta)))/2000 + (49*windspeed^2*cos(xderp(6))*sin(xderp(5))*(3*Cl_s*cos(alpha) - 14*Cn_s*sin(alpha) + 11*Cl_s*cos(alpha)*cos(beta)^2 + 11*Cm_s*cos(alpha)*cos(beta)*sin(beta)))/2000;
		D_B = -(49*windspeed^2*(CD_s*cos(alpha) - CL_s*sin(alpha)))/200;
		Y_B = (49*CY_s*windspeed^2)/200;
		L_B = -(49*windspeed^2*(CL_s*cos(alpha) + CD_s*sin(alpha)))/200;
		l_B = -(49*windspeed^2*(3*Cl_s*cos(alpha) - 14*Cn_s*sin(alpha) + 11*Cl_s*cos(alpha)*cos(beta)^2 + 11*Cm_s*cos(alpha)*cos(beta)*sin(beta)))/2000;
		m_B = (49*windspeed^2*((17*Cm_s)/2 - (11*Cm_s*cos(2*beta))/2 + (11*Cl_s*sin(2*beta))/2))/2000;
		n_B = -(49*windspeed^2*(14*Cn_s*cos(alpha) + 3*Cl_s*sin(alpha) + 11*Cl_s*cos(beta)^2*sin(alpha) + 11*Cm_s*cos(beta)*sin(alpha)*sin(beta)))/2000;

		windStates(i,:) = [tderp alpha beta windspeed p q r];
		T_B(i,:) = [tderp Tx Ty Tz];
		T_O(i,:) = [tderp T_x_O T_y_O T_z_O];
		rGP_B(i,:) = [tderp rGP_x_B rGP_y_B rGP_z_B];
		rGP_O(i,:) = [tderp rGP_x_O rGP_y_O rGP_z_O];
		rPB_O(i,:) = [tderp rPB_x_O rPB_y_O rPB_z_O];
		rBO_O(i,:) = [tderp rBO_x_O rBO_y_O rBO_z_O];
		rGO_B(i,:) = [tderp rGO_x_B rGO_y_B rGO_z_B];
		rPQ_B(i,:) = [tderp rPQ_x_B rPQ_y_B rPQ_z_B];
		rBQ_B(i,:) = [tderp rBQ_x_B rBQ_y_B rBQ_z_B];
		rPB_B(i,:) = [tderp rPB_x_B rPB_y_B rPB_z_B];
		Fg_B(i,:) = [tderp Fg_x_B Fg_y_B Fg_z_B];
		aeroCoeffs_S(i,:) = [tderp CD_s CY_s CL_s Cl_s Cm_s Cn_s];
		aeroForces_S(i,:) = [tderp D_S Y_S L_S];
		aeroMoments_S(i,:) = [tderp l_S m_S n_S];
		aeroForces_O(i,:) = [tderp D_O Y_O L_O];
		aeroMoments_O(i,:) = [tderp l_O m_O n_O];
		aeroForces_B(i,:) = [tderp D_B Y_B L_B];
		aeroMoments_O(i,:) = [tderp l_B m_B n_B];

	end

	cd(solutionsFolder);
	save leftovers.mat;
	cd ..;

end