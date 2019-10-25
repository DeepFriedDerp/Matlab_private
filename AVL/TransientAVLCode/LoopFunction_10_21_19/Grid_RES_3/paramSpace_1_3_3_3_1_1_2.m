function [aeroForces] = paramSpace_1_3_3_3_1_1_2(sailStates,airStates)

	CL = (4.084583)*sailStates.alpha + (0.257850)*sailStates.beta + (-2.544251)*sailStates.p + (36.947632)*sailStates.q + (-1.395889)*sailStates.r + (0.011122)*sailStates.de;
	CD = -0.131720;
	CY = (-0.064113)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.403482)*sailStates.p + (-0.491627)*sailStates.q + (-0.071191)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.136109)*sailStates.alpha + (0.299021)*sailStates.beta + (-1.147016)*sailStates.p + (9.812744)*sailStates.q + (-1.070607)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-13.118559)*sailStates.alpha + (-0.899746)*sailStates.beta + (8.036660)*sailStates.p + (-135.234604)*sailStates.q + (4.650178)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.046416)*sailStates.alpha + (0.039934)*sailStates.beta + (0.776179)*sailStates.p + (-2.672847)*sailStates.q + (-0.016388)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end