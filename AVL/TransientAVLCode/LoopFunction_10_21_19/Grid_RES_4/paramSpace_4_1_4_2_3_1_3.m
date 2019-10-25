function [aeroForces] = paramSpace_4_1_4_2_3_1_3(sailStates,airStates)

	CL = (4.061005)*sailStates.alpha + (-0.008403)*sailStates.beta + (-2.792645)*sailStates.p + (34.662239)*sailStates.q + (-0.068226)*sailStates.r + (0.009830)*sailStates.de;
	CD = -0.346400;
	CY = (0.000380)*sailStates.alpha + (-0.023196)*sailStates.beta + (-0.299318)*sailStates.p + (0.455226)*sailStates.q + (0.059587)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.516266)*sailStates.alpha + (0.132925)*sailStates.beta + (-1.508334)*sailStates.p + (12.500936)*sailStates.q + (-0.262660)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-14.417835)*sailStates.alpha + (-0.010401)*sailStates.beta + (10.272481)*sailStates.p + (-145.756378)*sailStates.q + (0.101034)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.199908)*sailStates.alpha + (-0.038590)*sailStates.beta + (0.953877)*sailStates.p + (-5.849278)*sailStates.q + (-0.078116)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end