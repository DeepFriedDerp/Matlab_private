function [aeroForces] = paramSpace_4_2_3_1_2_2_1(sailStates,airStates)

	CL = (3.574495)*sailStates.alpha + (0.056408)*sailStates.beta + (-1.627697)*sailStates.p + (28.041403)*sailStates.q + (0.647062)*sailStates.r + (0.010207)*sailStates.de;
	CD = 0.060530;
	CY = (0.035782)*sailStates.alpha + (-0.024249)*sailStates.beta + (0.123579)*sailStates.p + (0.662188)*sailStates.q + (-0.024558)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (0.599391)*sailStates.alpha + (-0.077388)*sailStates.beta + (-0.479173)*sailStates.p + (3.369392)*sailStates.q + (0.411135)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-12.707339)*sailStates.alpha + (-0.216426)*sailStates.beta + (5.415341)*sailStates.p + (-110.966957)*sailStates.q + (-2.194307)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (0.124119)*sailStates.alpha + (0.016853)*sailStates.beta + (-0.235620)*sailStates.p + (0.473615)*sailStates.q + (-0.016015)*sailStates.r + (-0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end