function [aeroForces] = paramSpace_4_2_4_1_3_2_2(sailStates,airStates)

	CL = (3.757074)*sailStates.alpha + (0.059234)*sailStates.beta + (-2.528190)*sailStates.p + (35.080952)*sailStates.q + (0.573101)*sailStates.r + (0.010512)*sailStates.de;
	CD = 0.083540;
	CY = (0.202249)*sailStates.alpha + (-0.023033)*sailStates.beta + (-0.021057)*sailStates.p + (1.664522)*sailStates.q + (0.004367)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.171510)*sailStates.alpha + (-0.042955)*sailStates.beta + (-1.208901)*sailStates.p + (10.021900)*sailStates.q + (0.365989)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-13.624482)*sailStates.alpha + (-0.248937)*sailStates.beta + (8.726661)*sailStates.p + (-137.222183)*sailStates.q + (-2.012584)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.398069)*sailStates.alpha + (0.007191)*sailStates.beta + (0.219850)*sailStates.p + (-3.129155)*sailStates.q + (-0.069240)*sailStates.r + (-0.000503)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end