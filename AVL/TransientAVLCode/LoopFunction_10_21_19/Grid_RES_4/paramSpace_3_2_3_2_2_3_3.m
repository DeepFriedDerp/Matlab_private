function [aeroForces] = paramSpace_3_2_3_2_2_3_3(sailStates,airStates)

	CL = (4.517220)*sailStates.alpha + (0.107990)*sailStates.beta + (-2.995050)*sailStates.p + (39.443649)*sailStates.q + (1.400159)*sailStates.r + (0.011471)*sailStates.de;
	CD = -0.482670;
	CY = (0.083272)*sailStates.alpha + (-0.025016)*sailStates.beta + (0.576314)*sailStates.p + (-0.100923)*sailStates.q + (-0.037777)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.549244)*sailStates.alpha + (-0.252660)*sailStates.beta + (-1.561181)*sailStates.p + (13.356629)*sailStates.q + (1.229223)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-13.950802)*sailStates.alpha + (-0.424267)*sailStates.beta + (9.873325)*sailStates.p + (-148.239975)*sailStates.q + (-4.754979)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.276645)*sailStates.alpha + (0.018984)*sailStates.beta + (-1.194505)*sailStates.p + (5.116313)*sailStates.q + (0.004392)*sailStates.r + (0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end