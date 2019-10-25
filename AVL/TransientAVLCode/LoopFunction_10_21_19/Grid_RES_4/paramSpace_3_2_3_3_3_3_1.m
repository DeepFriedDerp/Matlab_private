function [aeroForces] = paramSpace_3_2_3_3_3_3_1(sailStates,airStates)

	CL = (4.183420)*sailStates.alpha + (0.070126)*sailStates.beta + (-2.328354)*sailStates.p + (33.622211)*sailStates.q + (0.825948)*sailStates.r + (0.011060)*sailStates.de;
	CD = -0.140400;
	CY = (0.038916)*sailStates.alpha + (-0.024755)*sailStates.beta + (0.300302)*sailStates.p + (0.563441)*sailStates.q + (-0.019663)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.138199)*sailStates.alpha + (-0.155103)*sailStates.beta + (-1.020228)*sailStates.p + (8.213698)*sailStates.q + (0.717963)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-14.200234)*sailStates.alpha + (-0.280863)*sailStates.beta + (7.798526)*sailStates.p + (-130.282166)*sailStates.q + (-2.817414)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.122698)*sailStates.alpha + (0.011290)*sailStates.beta + (-0.630955)*sailStates.p + (2.234386)*sailStates.q + (-0.001388)*sailStates.r + (-0.000116)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end