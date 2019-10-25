function [aeroForces] = paramSpace_2_1_3_1_2_1_1(sailStates,airStates)

	CL = (6.121000)*sailStates.alpha + (-0.560632)*sailStates.beta + (-1.720489)*sailStates.p + (30.186165)*sailStates.q + (-2.433243)*sailStates.r + (0.011023)*sailStates.de;
	CD = -2.306200;
	CY = (0.368270)*sailStates.alpha + (-0.024573)*sailStates.beta + (-1.081822)*sailStates.p + (-0.221992)*sailStates.q + (-0.070914)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.331498)*sailStates.alpha + (0.388911)*sailStates.beta + (-0.543373)*sailStates.p + (4.311692)*sailStates.q + (-2.202834)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-12.353120)*sailStates.alpha + (2.162468)*sailStates.beta + (5.244266)*sailStates.p + (-111.854546)*sailStates.q + (8.244070)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-1.935564)*sailStates.alpha + (0.038851)*sailStates.beta + (2.418422)*sailStates.p + (-10.837577)*sailStates.q + (0.016478)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end