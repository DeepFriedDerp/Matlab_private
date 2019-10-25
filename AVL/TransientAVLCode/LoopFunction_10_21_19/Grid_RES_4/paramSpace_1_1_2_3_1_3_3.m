function [aeroForces] = paramSpace_1_1_2_3_1_3_3(sailStates,airStates)

	CL = (3.865649)*sailStates.alpha + (-0.057383)*sailStates.beta + (-2.676102)*sailStates.p + (34.764790)*sailStates.q + (-0.297490)*sailStates.r + (0.010098)*sailStates.de;
	CD = -0.086330;
	CY = (-0.021269)*sailStates.alpha + (-0.023817)*sailStates.beta + (0.122694)*sailStates.p + (-0.294836)*sailStates.q + (0.024416)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.371590)*sailStates.alpha + (-0.073148)*sailStates.beta + (-1.400205)*sailStates.p + (11.767666)*sailStates.q + (-0.059768)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-14.200443)*sailStates.alpha + (0.203896)*sailStates.beta + (9.513840)*sailStates.p + (-141.543869)*sailStates.q + (1.071127)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.258268)*sailStates.alpha + (-0.018915)*sailStates.beta + (-0.522423)*sailStates.p + (3.591637)*sailStates.q + (-0.060438)*sailStates.r + (0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end