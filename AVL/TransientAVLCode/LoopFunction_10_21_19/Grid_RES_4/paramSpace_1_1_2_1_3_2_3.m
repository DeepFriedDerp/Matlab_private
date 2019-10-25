function [aeroForces] = paramSpace_1_1_2_1_3_2_3(sailStates,airStates)

	CL = (3.856439)*sailStates.alpha + (-0.321095)*sailStates.beta + (-3.263915)*sailStates.p + (42.576820)*sailStates.q + (-1.752734)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.022070;
	CY = (0.085751)*sailStates.alpha + (-0.032432)*sailStates.beta + (-0.596990)*sailStates.p + (2.326708)*sailStates.q + (-0.118832)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.698367)*sailStates.alpha + (0.078055)*sailStates.beta + (-1.870180)*sailStates.p + (17.250214)*sailStates.q + (-1.324108)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-12.926522)*sailStates.alpha + (1.155746)*sailStates.beta + (10.285890)*sailStates.p + (-155.326050)*sailStates.q + (5.832957)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.608068)*sailStates.alpha + (0.043446)*sailStates.beta + (0.946127)*sailStates.p + (-4.523749)*sailStates.q + (-0.001093)*sailStates.r + (-0.000743)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end