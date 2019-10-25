function [aeroForces] = paramSpace_4_1_2_3_2_2_1(sailStates,airStates)

	CL = (3.817626)*sailStates.alpha + (0.180146)*sailStates.beta + (-2.210914)*sailStates.p + (32.852669)*sailStates.q + (0.873995)*sailStates.r + (0.010398)*sailStates.de;
	CD = 0.057270;
	CY = (0.004130)*sailStates.alpha + (-0.024186)*sailStates.beta + (0.181899)*sailStates.p + (0.194782)*sailStates.q + (-0.036189)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.127634)*sailStates.alpha + (-0.042440)*sailStates.beta + (-0.995818)*sailStates.p + (8.442545)*sailStates.q + (0.587438)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-13.531077)*sailStates.alpha + (-0.623156)*sailStates.beta + (7.304352)*sailStates.p + (-126.796555)*sailStates.q + (-2.930509)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.057837)*sailStates.alpha + (0.016425)*sailStates.beta + (-0.262300)*sailStates.p + (0.500936)*sailStates.q + (-0.025297)*sailStates.r + (-0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end