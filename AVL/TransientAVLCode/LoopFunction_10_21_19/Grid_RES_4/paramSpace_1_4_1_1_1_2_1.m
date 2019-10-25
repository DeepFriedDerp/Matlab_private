function [aeroForces] = paramSpace_1_4_1_1_1_2_1(sailStates,airStates)

	CL = (3.516596)*sailStates.alpha + (0.127706)*sailStates.beta + (-1.657461)*sailStates.p + (27.546146)*sailStates.q + (-0.220616)*sailStates.r + (0.009969)*sailStates.de;
	CD = 0.054050;
	CY = (-0.323939)*sailStates.alpha + (-0.032916)*sailStates.beta + (0.128465)*sailStates.p + (-2.326709)*sailStates.q + (0.025803)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.494950)*sailStates.alpha + (0.028243)*sailStates.beta + (-0.437688)*sailStates.p + (2.417075)*sailStates.q + (-0.066092)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-12.958903)*sailStates.alpha + (-0.575874)*sailStates.beta + (5.914955)*sailStates.p + (-112.315697)*sailStates.q + (0.834146)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (0.434909)*sailStates.alpha + (0.015171)*sailStates.beta + (-0.290877)*sailStates.p + (3.150002)*sailStates.q + (-0.054321)*sailStates.r + (0.000685)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end