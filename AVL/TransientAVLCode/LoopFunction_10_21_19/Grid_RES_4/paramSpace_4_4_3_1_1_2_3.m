function [aeroForces] = paramSpace_4_4_3_1_1_2_3(sailStates,airStates)

	CL = (3.856440)*sailStates.alpha + (-0.321095)*sailStates.beta + (-3.263915)*sailStates.p + (42.576820)*sailStates.q + (1.752734)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.022070;
	CY = (-0.085751)*sailStates.alpha + (-0.017140)*sailStates.beta + (0.596990)*sailStates.p + (-2.326708)*sailStates.q + (-0.118832)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (1.595973)*sailStates.alpha + (-0.326656)*sailStates.beta + (-1.775806)*sailStates.p + (16.062319)*sailStates.q + (1.305294)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-12.926522)*sailStates.alpha + (1.155745)*sailStates.beta + (10.285890)*sailStates.p + (-155.326050)*sailStates.q + (-5.832957)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-0.531776)*sailStates.alpha + (0.037056)*sailStates.beta + (-0.964899)*sailStates.p + (4.760036)*sailStates.q + (0.002649)*sailStates.r + (0.000743)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end