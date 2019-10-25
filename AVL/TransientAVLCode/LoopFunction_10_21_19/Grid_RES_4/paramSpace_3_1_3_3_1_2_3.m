function [aeroForces] = paramSpace_3_1_3_3_1_2_3(sailStates,airStates)

	CL = (3.987576)*sailStates.alpha + (0.102640)*sailStates.beta + (-2.802213)*sailStates.p + (36.847054)*sailStates.q + (0.499799)*sailStates.r + (0.010985)*sailStates.de;
	CD = 0.023530;
	CY = (-0.051571)*sailStates.alpha + (-0.025447)*sailStates.beta + (0.173591)*sailStates.p + (-0.563442)*sailStates.q + (-0.011398)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.425253)*sailStates.alpha + (-0.029169)*sailStates.beta + (-1.457090)*sailStates.p + (12.298163)*sailStates.q + (0.376370)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.341582)*sailStates.alpha + (-0.396687)*sailStates.beta + (9.499818)*sailStates.p + (-143.062866)*sailStates.q + (-1.696863)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.037103)*sailStates.alpha + (0.004494)*sailStates.beta + (-0.281939)*sailStates.p + (1.332510)*sailStates.q + (0.000070)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end