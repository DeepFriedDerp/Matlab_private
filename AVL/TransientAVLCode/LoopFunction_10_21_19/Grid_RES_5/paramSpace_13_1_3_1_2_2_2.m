function [aeroForces] = paramSpace_13_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.351222)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.111302)*sailStates.p + (43.372078)*sailStates.q + (2.108612)*sailStates.r + (0.011787)*sailStates.de;
	CD = -0.614940;
	CY = (0.238302)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.703741)*sailStates.p + (0.624081)*sailStates.q + (-0.124066)*sailStates.r + (0.000134)*sailStates.de;

	Cl = (1.291368)*sailStates.alpha + (-0.376763)*sailStates.beta + (-1.624671)*sailStates.p + (14.801310)*sailStates.q + (1.760802)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-11.550207)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.464137)*sailStates.p + (-150.579605)*sailStates.q + (-7.059402)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (-0.707355)*sailStates.alpha + (0.066433)*sailStates.beta + (-1.358960)*sailStates.p + (4.614325)*sailStates.q + (-0.020424)*sailStates.r + (-0.000051)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end