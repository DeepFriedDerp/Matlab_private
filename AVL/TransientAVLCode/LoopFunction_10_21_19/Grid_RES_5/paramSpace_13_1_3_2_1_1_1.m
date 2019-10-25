function [aeroForces] = paramSpace_13_1_3_2_1_1_1(sailStates,airStates)

	CL = (3.923279)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.247054)*sailStates.p + (31.865217)*sailStates.q + (0.372081)*sailStates.r + (0.010271)*sailStates.de;
	CD = -0.006560;
	CY = (-0.031825)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.003107)*sailStates.p + (-0.261303)*sailStates.q + (0.000538)*sailStates.r + (-0.000055)*sailStates.de;

	Cl = (1.101349)*sailStates.alpha + (0.011976)*sailStates.beta + (-0.985735)*sailStates.p + (7.829227)*sailStates.q + (0.136723)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-14.428325)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.828560)*sailStates.p + (-129.217163)*sailStates.q + (-1.283963)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (-0.142613)*sailStates.alpha + (-0.002112)*sailStates.beta + (0.165311)*sailStates.p + (-1.060975)*sailStates.q + (-0.022615)*sailStates.r + (0.000053)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end