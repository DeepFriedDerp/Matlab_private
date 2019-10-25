function [aeroForces] = paramSpace_1_1_4_2_2_3_2(sailStates,airStates)

	CL = (4.170750)*sailStates.alpha + (0.063835)*sailStates.beta + (-2.385129)*sailStates.p + (31.338888)*sailStates.q + (0.056490)*sailStates.r + (0.009896)*sailStates.de;
	CD = -0.337640;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.270222)*sailStates.p + (-0.000000)*sailStates.q + (0.053751)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.315962)*sailStates.alpha + (-0.131303)*sailStates.beta + (-1.177548)*sailStates.p + (9.470954)*sailStates.q + (0.302004)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-15.151520)*sailStates.alpha + (-0.369559)*sailStates.beta + (8.792541)*sailStates.p + (-133.820877)*sailStates.q + (-0.145952)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.303293)*sailStates.alpha + (-0.034484)*sailStates.beta + (-0.802078)*sailStates.p + (4.240553)*sailStates.q + (-0.053217)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end