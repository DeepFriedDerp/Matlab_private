function [aeroForces] = paramSpace_4_2_4_3_2_1_1(sailStates,airStates)

	CL = (3.856805)*sailStates.alpha + (0.022935)*sailStates.beta + (-2.178634)*sailStates.p + (30.888527)*sailStates.q + (0.236160)*sailStates.r + (0.009925)*sailStates.de;
	CD = -0.040930;
	CY = (0.033523)*sailStates.alpha + (-0.024749)*sailStates.beta + (-0.090724)*sailStates.p + (0.194783)*sailStates.q + (0.018067)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.101018)*sailStates.alpha + (0.041691)*sailStates.beta + (-0.956807)*sailStates.p + (7.511975)*sailStates.q + (0.019498)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-14.276391)*sailStates.alpha + (-0.102106)*sailStates.beta + (7.780535)*sailStates.p + (-127.822792)*sailStates.q + (-0.874446)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.286290)*sailStates.alpha + (-0.009489)*sailStates.beta + (0.375289)*sailStates.p + (-2.484460)*sailStates.q + (-0.040941)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end