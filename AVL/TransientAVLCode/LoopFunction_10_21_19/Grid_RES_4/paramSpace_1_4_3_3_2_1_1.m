function [aeroForces] = paramSpace_1_4_3_3_2_1_1(sailStates,airStates)

	CL = (4.125944)*sailStates.alpha + (0.333540)*sailStates.beta + (-2.260837)*sailStates.p + (35.181946)*sailStates.q + (-1.535284)*sailStates.r + (0.010854)*sailStates.de;
	CD = -0.186910;
	CY = (0.028479)*sailStates.alpha + (-0.025386)*sailStates.beta + (-0.484953)*sailStates.p + (-0.194783)*sailStates.q + (-0.096470)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.078287)*sailStates.alpha + (0.342917)*sailStates.beta + (-0.917218)*sailStates.p + (7.869641)*sailStates.q + (-1.182002)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-12.598148)*sailStates.alpha + (-1.209830)*sailStates.beta + (6.871937)*sailStates.p + (-126.796555)*sailStates.q + (5.104403)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.257137)*sailStates.alpha + (0.048717)*sailStates.beta + (0.970612)*sailStates.p + (-3.828907)*sailStates.q + (-0.005772)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end