function [aeroForces] = paramSpace_7_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.276589)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.797236)*sailStates.p + (37.047531)*sailStates.q + (-0.823075)*sailStates.r + (0.011298)*sailStates.de;
	CD = -0.140640;
	CY = (0.024991)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.342915)*sailStates.p + (0.438541)*sailStates.q + (-0.011929)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.443005)*sailStates.alpha + (0.153704)*sailStates.beta + (-1.389746)*sailStates.p + (11.500607)*sailStates.q + (-0.687851)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.742785)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.450973)*sailStates.p + (-143.320496)*sailStates.q + (2.757336)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (-0.021226)*sailStates.alpha + (0.005367)*sailStates.beta + (0.730136)*sailStates.p + (-3.625959)*sailStates.q + (0.002844)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end