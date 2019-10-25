function [aeroForces] = paramSpace_1_4_4_2_2_3_2(sailStates,airStates)

	CL = (4.170751)*sailStates.alpha + (-0.063835)*sailStates.beta + (-2.385129)*sailStates.p + (31.338888)*sailStates.q + (0.056490)*sailStates.r + (0.009896)*sailStates.de;
	CD = -0.337640;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.270222)*sailStates.p + (-0.000000)*sailStates.q + (0.053751)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.164026)*sailStates.alpha + (-0.140018)*sailStates.beta + (-1.083142)*sailStates.p + (8.283073)*sailStates.q + (0.320655)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-15.151522)*sailStates.alpha + (0.369559)*sailStates.beta + (8.792541)*sailStates.p + (-133.820877)*sailStates.q + (-0.145952)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.309737)*sailStates.alpha + (-0.019485)*sailStates.beta + (-0.783300)*sailStates.p + (4.004269)*sailStates.q + (-0.049507)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end