function [aeroForces] = paramSpace_4_2_4_1_3_1_2(sailStates,airStates)

	CL = (6.549936)*sailStates.alpha + (-0.115814)*sailStates.beta + (-2.358271)*sailStates.p + (27.148853)*sailStates.q + (-1.679317)*sailStates.r + (0.008939)*sailStates.de;
	CD = -2.496810;
	CY = (0.164703)*sailStates.alpha + (-0.023033)*sailStates.beta + (-1.053078)*sailStates.p + (1.664520)*sailStates.q + (0.209649)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.428172)*sailStates.alpha + (0.423498)*sailStates.beta + (-1.155124)*sailStates.p + (7.927661)*sailStates.q + (-1.722511)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-18.020191)*sailStates.alpha + (0.418711)*sailStates.beta + (10.199206)*sailStates.p + (-137.222183)*sailStates.q + (5.390407)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.866367)*sailStates.alpha + (-0.098807)*sailStates.beta + (2.568028)*sailStates.p + (-13.657604)*sailStates.q + (-0.122921)*sailStates.r + (-0.000703)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end