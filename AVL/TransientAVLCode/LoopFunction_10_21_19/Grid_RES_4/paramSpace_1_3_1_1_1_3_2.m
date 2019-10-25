function [aeroForces] = paramSpace_1_3_1_1_1_3_2(sailStates,airStates)

	CL = (6.549936)*sailStates.alpha + (-0.115814)*sailStates.beta + (-2.358271)*sailStates.p + (27.148853)*sailStates.q + (1.679317)*sailStates.r + (0.008939)*sailStates.de;
	CD = -2.496810;
	CY = (-0.164703)*sailStates.alpha + (-0.026920)*sailStates.beta + (1.053078)*sailStates.p + (-1.664520)*sailStates.q + (0.209649)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (2.372912)*sailStates.alpha + (-0.496949)*sailStates.beta + (-1.123592)*sailStates.p + (7.530689)*sailStates.q + (1.728825)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-18.020191)*sailStates.alpha + (0.418712)*sailStates.beta + (10.199206)*sailStates.p + (-137.222183)*sailStates.q + (-5.390409)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.897131)*sailStates.alpha + (-0.084282)*sailStates.beta + (-2.561756)*sailStates.p + (13.578642)*sailStates.q + (-0.121665)*sailStates.r + (0.000703)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end