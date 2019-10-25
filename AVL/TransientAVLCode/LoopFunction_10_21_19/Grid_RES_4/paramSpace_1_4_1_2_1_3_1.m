function [aeroForces] = paramSpace_1_4_1_2_1_3_1(sailStates,airStates)

	CL = (4.133454)*sailStates.alpha + (-0.051816)*sailStates.beta + (-2.018099)*sailStates.p + (28.055950)*sailStates.q + (0.381806)*sailStates.r + (0.009463)*sailStates.de;
	CD = -0.394360;
	CY = (-0.187190)*sailStates.alpha + (-0.028480)*sailStates.beta + (0.395294)*sailStates.p + (-1.057314)*sailStates.q + (0.078742)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.062871)*sailStates.alpha + (-0.186964)*sailStates.beta + (-0.778036)*sailStates.p + (5.187526)*sailStates.q + (0.537842)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-14.926093)*sailStates.alpha + (0.136796)*sailStates.beta + (7.772415)*sailStates.p + (-124.043571)*sailStates.q + (-1.149077)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.702359)*sailStates.alpha + (-0.020104)*sailStates.beta + (-1.008712)*sailStates.p + (5.770442)*sailStates.q + (-0.063267)*sailStates.r + (0.000390)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end