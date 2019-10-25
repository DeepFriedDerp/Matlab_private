function [aeroForces] = paramSpace_1_3_2_3_1_3_2(sailStates,airStates)

	CL = (3.968697)*sailStates.alpha + (0.015072)*sailStates.beta + (-2.444330)*sailStates.p + (32.896496)*sailStates.q + (-0.203965)*sailStates.r + (0.010132)*sailStates.de;
	CD = -0.097040;
	CY = (-0.058255)*sailStates.alpha + (-0.025514)*sailStates.beta + (0.151936)*sailStates.p + (-0.489619)*sailStates.q + (0.030239)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.216616)*sailStates.alpha + (-0.052410)*sailStates.beta + (-1.140341)*sailStates.p + (9.068952)*sailStates.q + (0.030224)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-14.619481)*sailStates.alpha + (-0.054507)*sailStates.beta + (8.766698)*sailStates.p + (-135.545776)*sailStates.q + (0.759968)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.317469)*sailStates.alpha + (-0.008476)*sailStates.beta + (-0.531178)*sailStates.p + (3.479783)*sailStates.q + (-0.054571)*sailStates.r + (0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end