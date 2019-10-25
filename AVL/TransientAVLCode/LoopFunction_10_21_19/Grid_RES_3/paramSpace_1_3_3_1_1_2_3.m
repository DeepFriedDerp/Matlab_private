function [aeroForces] = paramSpace_1_3_3_1_1_2_3(sailStates,airStates)

	CL = (3.458560)*sailStates.alpha + (0.121215)*sailStates.beta + (-3.390836)*sailStates.p + (41.942436)*sailStates.q + (-0.737299)*sailStates.r + (0.011177)*sailStates.de;
	CD = 0.061150;
	CY = (-0.134541)*sailStates.alpha + (-0.027289)*sailStates.beta + (-0.004658)*sailStates.p + (-1.081940)*sailStates.q + (-0.000924)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.194013)*sailStates.alpha + (0.092853)*sailStates.beta + (-1.857324)*sailStates.p + (15.940559)*sailStates.q + (-0.458407)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-12.749614)*sailStates.alpha + (-0.374096)*sailStates.beta + (11.582504)*sailStates.p + (-160.704956)*sailStates.q + (2.486214)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (0.364562)*sailStates.alpha + (0.016015)*sailStates.beta + (-0.237987)*sailStates.p + (2.951996)*sailStates.q + (-0.065133)*sailStates.r + (0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end