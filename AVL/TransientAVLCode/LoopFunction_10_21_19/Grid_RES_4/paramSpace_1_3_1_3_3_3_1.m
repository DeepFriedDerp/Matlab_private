function [aeroForces] = paramSpace_1_3_1_3_3_3_1(sailStates,airStates)

	CL = (3.830898)*sailStates.alpha + (0.028758)*sailStates.beta + (-2.164196)*sailStates.p + (30.969145)*sailStates.q + (-0.361447)*sailStates.r + (0.009923)*sailStates.de;
	CD = -0.010100;
	CY = (0.034437)*sailStates.alpha + (-0.024632)*sailStates.beta + (0.012941)*sailStates.p + (0.294836)*sailStates.q + (0.002542)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.030991)*sailStates.alpha + (-0.011795)*sailStates.beta + (-0.916283)*sailStates.p + (7.140524)*sailStates.q + (-0.116051)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-14.149016)*sailStates.alpha + (-0.121266)*sailStates.beta + (7.612945)*sailStates.p + (-127.124184)*sailStates.q + (1.278846)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.165517)*sailStates.alpha + (-0.002495)*sailStates.beta + (-0.204906)*sailStates.p + (1.291460)*sailStates.q + (-0.027779)*sailStates.r + (-0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end