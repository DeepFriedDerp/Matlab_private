function [xdot] = SailFunc(t,x)

	global otherstuff derp herp aeroForces
	persistent currentConfig aeroTriggers aeroTriggersLast settings results ...
	 CLa CLb CLde CLp CLq CLr ...
	CDtot ...
	CYa CYb CYde CYp CYq CYr ...
	Cla Clb Clde Clp Clq Clr ...
	Cma Cmb Cmde Cmp Cmq Cmr ...
	Cna Cnb Cnde Cnp Cnq Cnr ...
	vWO_X vWO_Y vWO_Z rCB_X de...
	callNum stallFlag ...
	;

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

	callNum = callNum + 1;

	alpha = acos((x(7) - x(8) + x(3)*x(10) - vWO_Y*sin(x(6)) - x(1)*x(12)*cos(x(4)) - x(2)*x(12)*cos(x(4)) + x(3)*x(12)*sin(x(4)) + x(3)*x(11)*sin(x(6)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) + vWO_Z*cos(x(5))*sin(x(4)) + vWO_Z*cos(x(6))*sin(x(5)) + vWO_X*sin(x(4))*sin(x(5)) + x(3)*x(11)*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)) + x(2)*x(11)*cos(x(6))*sin(x(4)) - vWO_X*cos(x(4))*cos(x(5))*sin(x(6)) + vWO_Z*cos(x(4))*sin(x(5))*sin(x(6)))/(abs(x(7) - x(8) + x(3)*x(10) - vWO_Y*sin(x(6)) - x(1)*x(12)*cos(x(4)) - x(2)*x(12)*cos(x(4)) + x(3)*x(12)*sin(x(4)) + x(3)*x(11)*sin(x(6)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) + vWO_Z*cos(x(5))*sin(x(4)) + vWO_Z*cos(x(6))*sin(x(5)) + vWO_X*sin(x(4))*sin(x(5)) + x(3)*x(11)*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)) + x(2)*x(11)*cos(x(6))*sin(x(4)) - vWO_X*cos(x(4))*cos(x(5))*sin(x(6)) + vWO_Z*cos(x(4))*sin(x(5))*sin(x(6)))^2 + abs(x(9) - x(8) + x(2)*x(10) + x(3)*x(10) - x(1)*x(12)*cos(x(4)) - x(1)*x(12)*sin(x(4)) + x(2)*x(11)*sin(x(6)) + x(3)*x(11)*sin(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) - vWO_Z*cos(x(4))*cos(x(5)) - vWO_X*cos(x(4))*sin(x(5)) + vWO_Y*cos(x(6))*sin(x(4)) + vWO_Z*cos(x(5))*sin(x(4)) + vWO_X*sin(x(4))*sin(x(5)) - x(1)*x(11)*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)) - vWO_X*cos(x(4))*cos(x(5))*sin(x(6)) - vWO_X*cos(x(5))*sin(x(4))*sin(x(6)) + vWO_Z*cos(x(4))*sin(x(5))*sin(x(6)) + vWO_Z*sin(x(4))*sin(x(5))*sin(x(6)))^2)^(1/2));
	beta = acos((x(7) - x(9) - x(2)*x(10) - vWO_Y*sin(x(6)) - x(2)*x(12)*cos(x(4)) + x(1)*x(12)*sin(x(4)) - x(2)*x(11)*sin(x(6)) + x(3)*x(12)*sin(x(4)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Z*cos(x(4))*cos(x(5)) + vWO_X*cos(x(4))*sin(x(5)) - vWO_Y*cos(x(6))*sin(x(4)) + vWO_Z*cos(x(6))*sin(x(5)) + x(1)*x(11)*cos(x(4))*cos(x(6)) + x(3)*x(11)*cos(x(4))*cos(x(6)) + x(2)*x(11)*cos(x(6))*sin(x(4)) + vWO_X*cos(x(5))*sin(x(4))*sin(x(6)) - vWO_Z*sin(x(4))*sin(x(5))*sin(x(6)))/(abs(x(7) - x(9) - x(2)*x(10) - vWO_Y*sin(x(6)) - x(2)*x(12)*cos(x(4)) + x(1)*x(12)*sin(x(4)) - x(2)*x(11)*sin(x(6)) + x(3)*x(12)*sin(x(4)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Z*cos(x(4))*cos(x(5)) + vWO_X*cos(x(4))*sin(x(5)) - vWO_Y*cos(x(6))*sin(x(4)) + vWO_Z*cos(x(6))*sin(x(5)) + x(1)*x(11)*cos(x(4))*cos(x(6)) + x(3)*x(11)*cos(x(4))*cos(x(6)) + x(2)*x(11)*cos(x(6))*sin(x(4)) + vWO_X*cos(x(5))*sin(x(4))*sin(x(6)) - vWO_Z*sin(x(4))*sin(x(5))*sin(x(6)))^2 + abs(x(9) - x(8) + x(2)*x(10) + x(3)*x(10) - x(1)*x(12)*cos(x(4)) - x(1)*x(12)*sin(x(4)) + x(2)*x(11)*sin(x(6)) + x(3)*x(11)*sin(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) - vWO_Z*cos(x(4))*cos(x(5)) - vWO_X*cos(x(4))*sin(x(5)) + vWO_Y*cos(x(6))*sin(x(4)) + vWO_Z*cos(x(5))*sin(x(4)) + vWO_X*sin(x(4))*sin(x(5)) - x(1)*x(11)*cos(x(4))*cos(x(6)) + x(1)*x(11)*cos(x(6))*sin(x(4)) - vWO_X*cos(x(4))*cos(x(5))*sin(x(6)) - vWO_X*cos(x(5))*sin(x(4))*sin(x(6)) + vWO_Z*cos(x(4))*sin(x(5))*sin(x(6)) + vWO_Z*sin(x(4))*sin(x(5))*sin(x(6)))^2)^(1/2));
	windspeed = (abs(x(7) - vWO_Y*sin(x(6)) - x(2)*x(12)*cos(x(4)) + x(3)*x(12)*sin(x(4)) - vWO_X*cos(x(5))*cos(x(6)) + vWO_Z*cos(x(6))*sin(x(5)) + x(3)*x(11)*cos(x(4))*cos(x(6)) + x(2)*x(11)*cos(x(6))*sin(x(4)))^2 + abs(x(3)*x(10) - x(8) - x(1)*x(12)*cos(x(4)) + x(3)*x(11)*sin(x(6)) + vWO_Y*cos(x(4))*cos(x(6)) + vWO_Z*cos(x(5))*sin(x(4)) + vWO_X*sin(x(4))*sin(x(5)) + x(1)*x(11)*cos(x(6))*sin(x(4)) - vWO_X*cos(x(4))*cos(x(5))*sin(x(6)) + vWO_Z*cos(x(4))*sin(x(5))*sin(x(6)))^2 + abs(x(1)*x(12)*sin(x(4)) - x(2)*x(10) - x(9) - x(2)*x(11)*sin(x(6)) + vWO_Z*cos(x(4))*cos(x(5)) + vWO_X*cos(x(4))*sin(x(5)) - vWO_Y*cos(x(6))*sin(x(4)) + x(1)*x(11)*cos(x(4))*cos(x(6)) + vWO_X*cos(x(5))*sin(x(4))*sin(x(6)) - vWO_Z*sin(x(4))*sin(x(5))*sin(x(6)))^2)^(1/2);
	p = x(10) + x(11)*sin(x(6));
	q = x(12)*sin(x(4)) + x(11)*cos(x(4))*cos(x(6));
	r = x(12)*cos(x(4)) - x(11)*cos(x(6))*sin(x(4));
	d_tether = (abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2) - 5342033081148201/70368744177664;
	Tx = -(75*((abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2) - 5342033081148201/70368744177664)*(x(1) + (762*cos(x(6))*sin(x(5)))/5))/(2*(abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2));
	Ty = -(75*((abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2) - 5342033081148201/70368744177664)*(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000))/(2*(abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2));
	Tz = -(75*((abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2) - 5342033081148201/70368744177664)*(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5))/(2*(abs(x(1) + (762*cos(x(6))*sin(x(5)))/5)^2 + abs(x(3) - (762*cos(x(4))*cos(x(5)))/5 + (762*sin(x(4))*sin(x(5))*sin(x(6)))/5)^2 + abs(x(2) - (762*cos(x(5))*sin(x(4)))/5 - (762*cos(x(4))*sin(x(5))*sin(x(6)))/5 + 2107/10000)^2)^(1/2));

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

	if t == 0
		findAeroFlag = 1;
	elseif ~stallFlag
		[findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);
	end

	if findAeroFlag || stallFlag
		[successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig( ...
			settings,currentConfig);
		if successFindAero
			aeroTriggersLast = aeroTriggers;
			stallFlag = 0;

			CLa = results(resultsCoords).cLa;
			CLb = results(resultsCoords).cLb;
			CLde = results(resultsCoords).cLde;
			CLp = results(resultsCoords).cLp;
			CLq = results(resultsCoords).cLq;
			CLr = results(resultsCoords).cLr;

			CDtot = results(resultsCoords).cDtot;

			CYa = results(resultsCoords).cYa;
			CYb = results(resultsCoords).cYb;
			CYde = results(resultsCoords).cYde;
			CYp = results(resultsCoords).cYp;
			CYq = results(resultsCoords).cYq;
			CYr = results(resultsCoords).cYr;

			Cla = results(resultsCoords).cla;
			Clb = results(resultsCoords).clb;
			Clde = results(resultsCoords).clde;
			Clp = results(resultsCoords).clp;
			Clq = results(resultsCoords).clq;
			Clr = results(resultsCoords).clr;

			Cma = results(resultsCoords).cma;
			Cmb = results(resultsCoords).cmb;
			Cmde = results(resultsCoords).cmde;
			Cmp = results(resultsCoords).cmp;
			Cmq = results(resultsCoords).cmq;
			Cmr = results(resultsCoords).cmr;

			Cna = results(resultsCoords).cna;
			Cnb = results(resultsCoords).cnb;
			Cnde = results(resultsCoords).cnde;
			Cnp = results(resultsCoords).cnp;
			Cnq = results(resultsCoords).cnq;
			Cnr = results(resultsCoords).cnr;
			rCB_X = (results(resultsCoords).npX);
			rCB_X = 0.48 - rCB_X;

		else

			stallFlag = 1;

			CLa = 0;
			CLb = 0;
			CLde = 0;
			CLp = 0;
			CLq = 0;
			CLr = 0;

			CYa = 0;
			CYb = 0;
			CYde = 0;
			CYp = 0;
			CYq = 0;
			CYr = 0;

			Cla = 0;
			Clb = 0;
			Clde = 0;
			Clp = 0;
			Clq = 0;
			Clr = 0;

			Cma = 0;
			Cmb = 0;
			Cmde = 0;
			Cmp = 0;
			Cmq = 0;
			Cmr = 0;

			Cna = 0;
			Cnb = 0;
			Cnde = 0;
			Cnp = 0;
			Cnq = 0;
			Cnr = 0;

		end
	end

	CL = CLa*alpha + CLb*beta + CLde*de + CLp*x(10) + CLp*x(11)*sin(x(6)) + CLq*x(12)*sin(x(4)) + CLr*x(12)*cos(x(4)) + CLq*x(11)*cos(x(4))*cos(x(6)) - CLr*x(11)*cos(x(6))*sin(x(4));
	CD = CDtot;
	CY = CYa*alpha + CYb*beta + CYde*de + CYp*x(10) + CYp*x(11)*sin(x(6)) + CYq*x(12)*sin(x(4)) + CYr*x(12)*cos(x(4)) + CYq*x(11)*cos(x(4))*cos(x(6)) - CYr*x(11)*cos(x(6))*sin(x(4));
	Cl = Cla*alpha + Clb*beta + Clde*de + Clp*x(10) + Clp*x(11)*sin(x(6)) + Clq*x(12)*sin(x(4)) + Clr*x(12)*cos(x(4)) + Clq*x(11)*cos(x(4))*cos(x(6)) - Clr*x(11)*cos(x(6))*sin(x(4));
	Cm = Cma*alpha + Cmb*beta + Cmde*de + Cmp*x(10) + Cmp*x(11)*sin(x(6)) + Cmq*x(12)*sin(x(4)) + Cmr*x(12)*cos(x(4)) + Cmq*x(11)*cos(x(4))*cos(x(6)) - Cmr*x(11)*cos(x(6))*sin(x(4));
	Cn = Cna*alpha + Cnb*beta + Cnde*de + Cnp*x(10) + Cnp*x(11)*sin(x(6)) + Cnq*x(12)*sin(x(4)) + Cnr*x(12)*cos(x(4)) + Cnq*x(11)*cos(x(4))*cos(x(6)) - Cnr*x(11)*cos(x(6))*sin(x(4));

	Q = 0.5 * 1.225 * windspeed * windspeed;

	L = CL * Q * 0.4;
	D = CD * Q * 0.4;
	Y = CY * Q * 0.4;
	l = Cl * Q * 0.4 * 1.4;
	m = Cm * Q * 0.4 * 0.3;
	n = Cn * Q * 0.4 * 1.4;

	xdot(1) = x(7);
	xdot(2) = x(8);
	xdot(3) = x(9);
	xdot(4) = x(10);
	xdot(5) = x(11);
	xdot(6) = x(12);
	xdot(7) = (5000*Tx)/5431 + (981*cos(x(6))*sin(x(5)))/100 + (2107*Tx*x(2))/904 - (84581*Tz*x(3))/434618 - (281*x(2)*x(10)^2)/904 + x(1)*x(12)^2 - (281*x(2)*x(11)^2)/904 + (281*x(2)*x(12)^2)/904 + 2*x(8)*x(12)*cos(x(4)) - 2*x(9)*x(12)*sin(x(4)) + (1225*CD*windspeed^2*cos(alpha))/5431 - (1225*CL*windspeed^2*sin(alpha))/5431 + x(1)*x(11)^2*cos(x(6))^2 - (281*x(2)*x(12)^2*cos(x(4))^2)/904 + (281*x(2)*x(11)^2*cos(x(6))^2)/904 - (222495*Cm*windspeed^2*x(3))/434618 + (26976*sin(2*x(4))*x(3)*x(12)^2)/217309 - 2*x(9)*x(11)*cos(x(4))*cos(x(6)) - 2*x(8)*x(11)*cos(x(6))*sin(x(4)) + (281*x(2)*x(11)^2*cos(x(4))^2*cos(x(6))^2)/904 - (1225*CY*rCB_X*windspeed^2*x(2))/452 - (27770*x(3)*x(10)*x(12)*cos(x(4)))/217309 - (53952*x(3)*x(11)*x(12)*cos(x(6)))/217309 - (129*x(2)*x(10)*x(12)*sin(x(4)))/452 - (281*x(2)*x(10)*x(11)*sin(x(6)))/452 - (1323*CD*windspeed^2*x(2)*cos(alpha))/1808 + (53109*CL*windspeed^2*x(3)*cos(alpha))/869236 + (68845*Cl*windspeed^2*x(3)*cos(alpha))/217309 + (1715*Cn*windspeed^2*x(2)*cos(alpha))/452 + (53109*CD*windspeed^2*x(3)*sin(alpha))/869236 + (1323*CL*windspeed^2*x(2)*sin(alpha))/1808 + (1715*Cl*windspeed^2*x(2)*sin(alpha))/452 - (68845*Cn*windspeed^2*x(3)*sin(alpha))/217309 - (370825*CL*rCB_X*windspeed^2*x(3)*cos(alpha))/217309 - (370825*CD*rCB_X*windspeed^2*x(3)*sin(alpha))/217309 - (129*x(2)*x(11)^2*cos(x(4))*cos(x(6))*sin(x(6)))/452 + (27770*x(3)*x(11)^2*cos(x(6))*sin(x(4))*sin(x(6)))/217309 - (129*x(2)*x(10)*x(11)*cos(x(4))*cos(x(6)))/452 + (27770*x(3)*x(10)*x(11)*cos(x(6))*sin(x(4)))/217309 - (27770*x(3)*x(11)*x(12)*cos(x(4))*sin(x(6)))/217309 - (129*x(2)*x(11)*x(12)*sin(x(4))*sin(x(6)))/452 - (53952*x(3)*x(11)^2*cos(x(4))*cos(x(6))^2*sin(x(4)))/217309 + (107904*x(3)*x(11)*x(12)*cos(x(4))^2*cos(x(6)))/217309 + (281*x(2)*x(11)*x(12)*cos(x(4))*cos(x(6))*sin(x(4)))/452;
	xdot(8) = (5000*Ty)/5431 - (981*cos(x(5))*sin(x(4)))/100 - (2107*Tx*x(1))/904 - (443373*Tz*x(3))/434618 + 2*x(9)*x(10) + (1225*CY*windspeed^2)/5431 + (281*x(1)*x(10)^2)/904 + (281*x(1)*x(11)^2)/904 + x(2)*x(10)^2 - (281*x(1)*x(12)^2)/904 + x(2)*x(11)^2 - (981*cos(x(4))*sin(x(5))*sin(x(6)))/100 - 2*x(7)*x(12)*cos(x(4)) + 2*x(9)*x(11)*sin(x(6)) + (281*x(1)*x(12)^2*cos(x(4))^2)/904 - (281*x(1)*x(11)^2*cos(x(6))^2)/904 + x(2)*x(12)^2*cos(x(4))^2 - (29505*Cm*windspeed^2*x(3))/434618 - (75901*sin(2*x(4))*x(3)*x(12)^2)/217309 + 2*x(7)*x(11)*cos(x(6))*sin(x(4)) - (281*x(1)*x(11)^2*cos(x(4))^2*cos(x(6))^2)/904 - x(2)*x(11)^2*cos(x(4))^2*cos(x(6))^2 + (1225*CY*rCB_X*windspeed^2*x(1))/452 + (53952*x(3)*x(10)*x(12)*cos(x(4)))/217309 + (151802*x(3)*x(11)*x(12)*cos(x(6)))/217309 - (775*x(1)*x(10)*x(12)*sin(x(4)))/452 + (281*x(1)*x(10)*x(11)*sin(x(6)))/452 + 2*x(2)*x(10)*x(11)*sin(x(6)) + (1323*CD*windspeed^2*x(1)*cos(alpha))/1808 + (278397*CL*windspeed^2*x(3)*cos(alpha))/869236 + (360885*Cl*windspeed^2*x(3)*cos(alpha))/217309 - (1715*Cn*windspeed^2*x(1)*cos(alpha))/452 + (278397*CD*windspeed^2*x(3)*sin(alpha))/869236 - (1323*CL*windspeed^2*x(1)*sin(alpha))/1808 - (1715*Cl*windspeed^2*x(1)*sin(alpha))/452 - (360885*Cn*windspeed^2*x(3)*sin(alpha))/217309 - (49175*CL*rCB_X*windspeed^2*x(3)*cos(alpha))/217309 - (49175*CD*rCB_X*windspeed^2*x(3)*sin(alpha))/217309 - (775*x(1)*x(11)^2*cos(x(4))*cos(x(6))*sin(x(6)))/452 - (53952*x(3)*x(11)^2*cos(x(6))*sin(x(4))*sin(x(6)))/217309 - (775*x(1)*x(10)*x(11)*cos(x(4))*cos(x(6)))/452 - (53952*x(3)*x(10)*x(11)*cos(x(6))*sin(x(4)))/217309 + (53952*x(3)*x(11)*x(12)*cos(x(4))*sin(x(6)))/217309 - (775*x(1)*x(11)*x(12)*sin(x(4))*sin(x(6)))/452 + (151802*x(3)*x(11)^2*cos(x(4))*cos(x(6))^2*sin(x(4)))/217309 - (303604*x(3)*x(11)*x(12)*cos(x(4))^2*cos(x(6)))/217309 - (281*x(1)*x(11)*x(12)*cos(x(4))*cos(x(6))*sin(x(4)))/452 - 2*x(2)*x(11)*x(12)*cos(x(4))*cos(x(6))*sin(x(4));
	xdot(9) = (5000*Tz)/5431 - (981*cos(x(4))*cos(x(5)))/100 + (84581*Tz*x(1))/434618 + (443373*Tz*x(2))/434618 - 2*x(8)*x(10) + x(3)*x(10)^2 + x(3)*x(11)^2 + x(3)*x(12)^2 + (981*sin(x(4))*sin(x(5))*sin(x(6)))/100 + 2*x(7)*x(12)*sin(x(4)) - 2*x(8)*x(11)*sin(x(6)) + (1225*CL*windspeed^2*cos(alpha))/5431 + (1225*CD*windspeed^2*sin(alpha))/5431 - x(3)*x(12)^2*cos(x(4))^2 - x(3)*x(11)^2*cos(x(6))^2 + (222495*Cm*windspeed^2*x(1))/434618 + (29505*Cm*windspeed^2*x(2))/434618 - (26976*sin(2*x(4))*x(1)*x(12)^2)/217309 - (141408*sin(2*x(4))*x(2)*x(12)^2)/217309 + 2*x(7)*x(11)*cos(x(4))*cos(x(6)) + x(3)*x(11)^2*cos(x(4))^2*cos(x(6))^2 - (406848*x(1)*x(10)*x(12)*cos(x(4)))/217309 - (53952*x(2)*x(10)*x(12)*cos(x(4)))/217309 + (53952*x(1)*x(11)*x(12)*cos(x(6)))/217309 + (282816*x(2)*x(11)*x(12)*cos(x(6)))/217309 + 2*x(3)*x(10)*x(11)*sin(x(6)) - (53109*CL*windspeed^2*x(1)*cos(alpha))/869236 - (278397*CL*windspeed^2*x(2)*cos(alpha))/869236 - (68845*Cl*windspeed^2*x(1)*cos(alpha))/217309 - (360885*Cl*windspeed^2*x(2)*cos(alpha))/217309 - (53109*CD*windspeed^2*x(1)*sin(alpha))/869236 - (278397*CD*windspeed^2*x(2)*sin(alpha))/869236 + (68845*Cn*windspeed^2*x(1)*sin(alpha))/217309 + (360885*Cn*windspeed^2*x(2)*sin(alpha))/217309 + (370825*CL*rCB_X*windspeed^2*x(1)*cos(alpha))/217309 + (49175*CL*rCB_X*windspeed^2*x(2)*cos(alpha))/217309 + (370825*CD*rCB_X*windspeed^2*x(1)*sin(alpha))/217309 + (49175*CD*rCB_X*windspeed^2*x(2)*sin(alpha))/217309 + (406848*x(1)*x(11)^2*cos(x(6))*sin(x(4))*sin(x(6)))/217309 + (53952*x(2)*x(11)^2*cos(x(6))*sin(x(4))*sin(x(6)))/217309 + (406848*x(1)*x(10)*x(11)*cos(x(6))*sin(x(4)))/217309 + (53952*x(2)*x(10)*x(11)*cos(x(6))*sin(x(4)))/217309 - (406848*x(1)*x(11)*x(12)*cos(x(4))*sin(x(6)))/217309 - (53952*x(2)*x(11)*x(12)*cos(x(4))*sin(x(6)))/217309 + (53952*x(1)*x(11)^2*cos(x(4))*cos(x(6))^2*sin(x(4)))/217309 + (282816*x(2)*x(11)^2*cos(x(4))*cos(x(6))^2*sin(x(4)))/217309 - (107904*x(1)*x(11)*x(12)*cos(x(4))^2*cos(x(6)))/217309 - (565632*x(2)*x(11)*x(12)*cos(x(4))^2*cos(x(6)))/217309 + 2*x(3)*x(11)*x(12)*cos(x(4))*cos(x(6))*sin(x(4));
	xdot(10) = -(112131444*x(11)*x(12) + 400809192*Tz*cos(x(6)) + 122127658*x(10)^2*sin(x(4))*sin(x(6)) + 122127658*x(11)^2*sin(x(4))*sin(x(6)) - 122127658*x(12)^2*sin(x(4))*sin(x(6)) + 244255316*x(10)*x(11)*sin(x(4)) - 673657900*x(10)*x(12)*sin(x(6)) + 26672520*Cm*windspeed^2*cos(x(6)) + 76461224*Tz*cos(x(4))*sin(x(6)) - 61923284*x(11)*x(12)*cos(x(4))^2 + 399199884*x(11)*x(12)*cos(x(6))^2 - 915740126*Tx*sin(x(4))*sin(x(6)) - 97545216*x(10)*x(12)*cos(x(4))*cos(x(6)) - 125835444*CL*windspeed^2*cos(alpha)*cos(x(6)) - 652480080*Cl*windspeed^2*cos(alpha)*cos(x(6)) - 125835444*CD*windspeed^2*sin(alpha)*cos(x(6)) + 652480080*Cn*windspeed^2*sin(alpha)*cos(x(6)) + 56513372*x(11)^2*cos(x(4))*cos(x(6))^3*sin(x(4)) + 201135480*Cm*windspeed^2*cos(x(4))*sin(x(6)) + 24582442*x(12)^2*cos(x(4))^2*sin(x(4))*sin(x(6)) - 24582442*x(11)^2*cos(x(6))^2*sin(x(4))*sin(x(6)) - 146710100*x(10)*x(11)*cos(x(6))^2*sin(x(4)) - 61923284*x(10)*x(12)*cos(x(4))^2*sin(x(6)) - 174950028*x(11)*x(12)*cos(x(4))^2*cos(x(6))^2 + 61923284*x(11)^2*cos(x(4))*cos(x(6))*sin(x(4)) - 118436656*x(12)^2*cos(x(4))*cos(x(6))*sin(x(4)) - 24005268*CL*windspeed^2*cos(alpha)*cos(x(4))*sin(x(6)) - 124471760*Cl*windspeed^2*cos(alpha)*cos(x(4))*sin(x(6)) + 287499807*CD*windspeed^2*cos(alpha)*sin(x(4))*sin(x(6)) - 24005268*CD*windspeed^2*sin(alpha)*cos(x(4))*sin(x(6)) - 1490739740*Cn*windspeed^2*cos(alpha)*sin(x(4))*sin(x(6)) + 124471760*Cn*windspeed^2*sin(alpha)*cos(x(4))*sin(x(6)) - 287499807*CL*windspeed^2*sin(alpha)*sin(x(4))*sin(x(6)) - 1490739740*Cl*windspeed^2*sin(alpha)*sin(x(4))*sin(x(6)) + 49164884*x(11)*x(12)*cos(x(4))^3*cos(x(6))*sin(x(6)) - 24582442*x(11)^2*cos(x(4))^2*cos(x(6))^2*sin(x(4))*sin(x(6)) + 88908400*CL*rCB_X*windspeed^2*cos(alpha)*cos(x(6)) + 88908400*CD*rCB_X*windspeed^2*sin(alpha)*cos(x(6)) + 1064814100*CY*rCB_X*windspeed^2*sin(x(4))*sin(x(6)) - 244255316*x(11)*x(12)*cos(x(4))*cos(x(6))*sin(x(6)) + 670451600*CL*rCB_X*windspeed^2*cos(alpha)*cos(x(4))*sin(x(6)) + 670451600*CD*rCB_X*windspeed^2*sin(alpha)*cos(x(4))*sin(x(6)) + 61923284*x(10)*x(11)*cos(x(4))*cos(x(6))*sin(x(4))*sin(x(6)))/(392894672*cos(x(6)));
	xdot(11) = (122127658*x(10)^2*sin(x(4)) + 122127658*x(11)^2*sin(x(4)) - 122127658*x(12)^2*sin(x(4)) - 673657900*x(10)*x(12) + 76461224*Tz*cos(x(4)) - 915740126*Tx*sin(x(4)) + 112131444*x(11)*x(12)*sin(x(6)) + 201135480*Cm*windspeed^2*cos(x(4)) + 24582442*x(12)^2*cos(x(4))^2*sin(x(4)) - 122127658*x(11)^2*cos(x(6))^2*sin(x(4)) - 61923284*x(10)*x(12)*cos(x(4))^2 - 146710100*x(11)*x(12)*cos(x(4))*cos(x(6)) - 24005268*CL*windspeed^2*cos(alpha)*cos(x(4)) - 124471760*Cl*windspeed^2*cos(alpha)*cos(x(4)) + 244255316*x(10)*x(11)*sin(x(4))*sin(x(6)) + 287499807*CD*windspeed^2*cos(alpha)*sin(x(4)) - 24005268*CD*windspeed^2*sin(alpha)*cos(x(4)) - 1490739740*Cn*windspeed^2*cos(alpha)*sin(x(4)) + 124471760*Cn*windspeed^2*sin(alpha)*cos(x(4)) - 287499807*CL*windspeed^2*sin(alpha)*sin(x(4)) - 1490739740*Cl*windspeed^2*sin(alpha)*sin(x(4)) + 49164884*x(11)*x(12)*cos(x(4))^3*cos(x(6)) - 61923284*x(11)*x(12)*cos(x(4))^2*sin(x(6)) - 24582442*x(11)^2*cos(x(4))^2*cos(x(6))^2*sin(x(4)) + 1064814100*CY*rCB_X*windspeed^2*sin(x(4)) + 670451600*CL*rCB_X*windspeed^2*cos(alpha)*cos(x(4)) + 670451600*CD*rCB_X*windspeed^2*sin(alpha)*cos(x(4)) + 61923284*x(11)^2*cos(x(4))*cos(x(6))*sin(x(4))*sin(x(6)) + 61923284*x(10)*x(11)*cos(x(4))*cos(x(6))*sin(x(4)))/(392894672*cos(x(6)));
	xdot(12) = (12291221*x(12)^2*cos(x(4)))/196447336 - (281*x(11)^2*cos(x(4)))/904 - (281*x(10)^2*cos(x(4)))/904 - (12291221*x(12)^2*cos(x(4))^3)/196447336 + (189539*sin(2*x(6))*x(11)^2)/434618 + (2107*Tx*cos(x(4)))/904 + (84581*Tz*sin(x(4)))/434618 + (406848*x(10)*x(11)*cos(x(6)))/217309 + (109836437*x(11)^2*cos(x(4))*cos(x(6))^2)/196447336 + (222495*Cm*windspeed^2*sin(x(4)))/434618 - (15480821*sin(2*x(4))*x(10)*x(12))/196447336 + (12291221*x(11)^2*cos(x(4))^3*cos(x(6))^2)/196447336 - (281*x(10)*x(11)*cos(x(4))*sin(x(6)))/452 + (53952*x(11)*x(12)*cos(x(6))*sin(x(4)))/217309 - (1323*CD*windspeed^2*cos(alpha)*cos(x(4)))/1808 + (1715*Cn*windspeed^2*cos(alpha)*cos(x(4)))/452 - (53109*CL*windspeed^2*cos(alpha)*sin(x(4)))/869236 + (1323*CL*windspeed^2*sin(alpha)*cos(x(4)))/1808 - (68845*Cl*windspeed^2*cos(alpha)*sin(x(4)))/217309 + (1715*Cl*windspeed^2*sin(alpha)*cos(x(4)))/452 - (15480821*x(11)^2*cos(x(4))^2*cos(x(6))*sin(x(6)))/98223668 - (53109*CD*windspeed^2*sin(alpha)*sin(x(4)))/869236 + (68845*Cn*windspeed^2*sin(alpha)*sin(x(4)))/217309 - (15480821*x(10)*x(11)*cos(x(4))^2*cos(x(6)))/98223668 - (1225*CY*rCB_X*windspeed^2*cos(x(4)))/452 - (15480821*x(11)*x(12)*cos(x(4))*sin(x(4))*sin(x(6)))/98223668 + (12291221*x(11)*x(12)*cos(x(4))^2*cos(x(6))*sin(x(4)))/98223668 + (370825*CL*rCB_X*windspeed^2*cos(alpha)*sin(x(4)))/217309 + (370825*CD*rCB_X*windspeed^2*sin(alpha)*sin(x(4)))/217309;

	derp(callNum,:) = [t xdot];
	herp(callNum,:) = [t alpha beta windspeed p q r d_tether Tx Ty Tz];
	aeroForces(callNum,:) = [t CL CD CY Cl Cm Cn L D Y l m n];

	xdot=xdot';

end


