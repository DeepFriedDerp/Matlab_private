function [aeroForces] = paramSpace_2_2_1_2_2_1_2(sailStates,airStates)

	CL = (4.585766)*sailStates.alpha + (-0.112759)*sailStates.beta + (-2.592621)*sailStates.p + (36.201538)*sailStates.q + (-1.355798)*sailStates.r + (0.011238)*sailStates.de;
	CD = -0.481170;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.574916)*sailStates.p + (-0.000000)*sailStates.q + (-0.037682)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.429436)*sailStates.alpha + (0.257543)*sailStates.beta + (-1.232509)*sailStates.p + (10.308522)*sailStates.q + (-1.209896)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.124656)*sailStates.alpha + (0.461761)*sailStates.beta + (8.527457)*sailStates.p + (-137.194580)*sailStates.q + (4.626824)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.115915)*sailStates.alpha + (0.019234)*sailStates.beta + (1.204630)*sailStates.p + (-5.101039)*sailStates.q + (0.004632)*sailStates.r + (-0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end