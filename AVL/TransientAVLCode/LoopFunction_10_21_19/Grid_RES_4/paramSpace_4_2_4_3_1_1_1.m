function [aeroForces] = paramSpace_4_2_4_3_1_1_1(sailStates,airStates)

	CL = (3.830898)*sailStates.alpha + (0.028758)*sailStates.beta + (-2.164196)*sailStates.p + (30.969145)*sailStates.q + (0.361447)*sailStates.r + (0.009923)*sailStates.de;
	CD = -0.010100;
	CY = (-0.034437)*sailStates.alpha + (-0.025320)*sailStates.beta + (-0.012941)*sailStates.p + (-0.294836)*sailStates.q + (0.002542)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.083463)*sailStates.alpha + (0.024994)*sailStates.beta + (-0.947816)*sailStates.p + (7.537490)*sailStates.q + (0.122366)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-14.149016)*sailStates.alpha + (-0.121266)*sailStates.beta + (7.612945)*sailStates.p + (-127.124184)*sailStates.q + (-1.278846)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.174306)*sailStates.alpha + (-0.004823)*sailStates.beta + (0.211178)*sailStates.p + (-1.370422)*sailStates.q + (-0.029035)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end