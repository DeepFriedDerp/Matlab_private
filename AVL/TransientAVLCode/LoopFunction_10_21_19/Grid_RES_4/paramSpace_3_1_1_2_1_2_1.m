function [aeroForces] = paramSpace_3_1_1_2_1_2_1(sailStates,airStates)

	CL = (3.998887)*sailStates.alpha + (0.057728)*sailStates.beta + (-2.137489)*sailStates.p + (31.462223)*sailStates.q + (0.467096)*sailStates.r + (0.010731)*sailStates.de;
	CD = 0.013490;
	CY = (-0.110408)*sailStates.alpha + (-0.025288)*sailStates.beta + (0.161002)*sailStates.p + (-0.668511)*sailStates.q + (-0.010482)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.125203)*sailStates.alpha + (-0.023255)*sailStates.beta + (-0.914482)*sailStates.p + (7.279834)*sailStates.q + (0.316016)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.423642)*sailStates.alpha + (-0.118590)*sailStates.beta + (7.263506)*sailStates.p + (-124.743294)*sailStates.q + (-1.546773)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.179887)*sailStates.alpha + (0.003897)*sailStates.beta + (-0.308683)*sailStates.p + (1.874274)*sailStates.q + (0.003070)*sailStates.r + (0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end