function [aeroForces] = paramSpace_2_1_1_3_1_1_1(sailStates,airStates)

	CL = (4.109106)*sailStates.alpha + (-0.230523)*sailStates.beta + (-2.308602)*sailStates.p + (33.372402)*sailStates.q + (-0.831649)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.137530;
	CY = (-0.036847)*sailStates.alpha + (-0.024006)*sailStates.beta + (-0.314462)*sailStates.p + (-0.563443)*sailStates.q + (-0.020551)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.169503)*sailStates.alpha + (0.124864)*sailStates.beta + (-1.043443)*sailStates.p + (8.542313)*sailStates.q + (-0.741860)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-13.909598)*sailStates.alpha + (0.973580)*sailStates.beta + (7.728767)*sailStates.p + (-129.238037)*sailStates.q + (2.856347)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.107116)*sailStates.alpha + (0.011401)*sailStates.beta + (0.649833)*sailStates.p + (-2.217752)*sailStates.q + (-0.001934)*sailStates.r + (0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end