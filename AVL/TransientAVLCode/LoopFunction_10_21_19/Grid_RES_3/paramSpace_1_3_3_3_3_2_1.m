function [aeroForces] = paramSpace_1_3_3_3_3_2_1(sailStates,airStates)

	CL = (3.945863)*sailStates.alpha + (0.142248)*sailStates.beta + (-2.220686)*sailStates.p + (32.888603)*sailStates.q + (-0.900242)*sailStates.r + (0.010586)*sailStates.de;
	CD = 0.031120;
	CY = (0.065780)*sailStates.alpha + (-0.024108)*sailStates.beta + (-0.228528)*sailStates.p + (0.318253)*sailStates.q + (-0.040265)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.041455)*sailStates.alpha + (0.149347)*sailStates.beta + (-0.909372)*sailStates.p + (7.331354)*sailStates.q + (-0.592027)*sailStates.r + (-0.000142)*sailStates.de;
	Cm = (-13.934927)*sailStates.alpha + (-0.443619)*sailStates.beta + (7.297765)*sailStates.p + (-126.937798)*sailStates.q + (2.995007)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.106211)*sailStates.alpha + (0.017926)*sailStates.beta + (0.394133)*sailStates.p + (-1.752954)*sailStates.q + (-0.006893)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end