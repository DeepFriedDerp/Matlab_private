function [aeroForces] = paramSpace_3_1_2_1_2_2_1(sailStates,airStates)

	CL = (3.698410)*sailStates.alpha + (0.042662)*sailStates.beta + (-1.662507)*sailStates.p + (27.526953)*sailStates.q + (0.211223)*sailStates.r + (0.010498)*sailStates.de;
	CD = 0.027050;
	CY = (0.015815)*sailStates.alpha + (-0.024573)*sailStates.beta + (0.031835)*sailStates.p + (0.221995)*sailStates.q + (-0.002094)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (0.677026)*sailStates.alpha + (-0.013400)*sailStates.beta + (-0.525032)*sailStates.p + (3.609607)*sailStates.q + (0.123808)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-13.545658)*sailStates.alpha + (-0.129825)*sailStates.beta + (5.737930)*sailStates.p + (-111.854546)*sailStates.q + (-0.712207)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (0.023855)*sailStates.alpha + (0.001381)*sailStates.beta + (-0.060771)*sailStates.p + (0.125843)*sailStates.q + (-0.001895)*sailStates.r + (-0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end