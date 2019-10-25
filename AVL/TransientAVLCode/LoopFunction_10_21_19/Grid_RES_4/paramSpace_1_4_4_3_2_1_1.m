function [aeroForces] = paramSpace_1_4_4_3_2_1_1(sailStates,airStates)

	CL = (4.151221)*sailStates.alpha + (0.312567)*sailStates.beta + (-2.261507)*sailStates.p + (35.133919)*sailStates.q + (-1.527067)*sailStates.r + (0.010939)*sailStates.de;
	CD = -0.184130;
	CY = (0.026880)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.470664)*sailStates.p + (-0.194784)*sailStates.q + (-0.093642)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.077916)*sailStates.alpha + (0.335626)*sailStates.beta + (-0.917542)*sailStates.p + (7.867421)*sailStates.q + (-1.158910)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-12.796988)*sailStates.alpha + (-1.078877)*sailStates.beta + (6.881093)*sailStates.p + (-126.796555)*sailStates.q + (5.058378)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.252763)*sailStates.alpha + (0.047358)*sailStates.beta + (0.949124)*sailStates.p + (-3.817745)*sailStates.q + (-0.005653)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end