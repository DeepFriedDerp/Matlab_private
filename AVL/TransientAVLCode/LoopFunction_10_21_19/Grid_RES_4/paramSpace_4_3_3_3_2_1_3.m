function [aeroForces] = paramSpace_4_3_3_3_2_1_3(sailStates,airStates)

	CL = (3.889043)*sailStates.alpha + (-0.025551)*sailStates.beta + (-2.680529)*sailStates.p + (35.114132)*sailStates.q + (0.430351)*sailStates.r + (0.010254)*sailStates.de;
	CD = -0.046340;
	CY = (-0.028466)*sailStates.alpha + (-0.024762)*sailStates.beta + (-0.043154)*sailStates.p + (-0.194782)*sailStates.q + (0.008577)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.272832)*sailStates.alpha + (0.019263)*sailStates.beta + (-1.337108)*sailStates.p + (11.076155)*sailStates.q + (0.155341)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-14.311791)*sailStates.alpha + (0.089374)*sailStates.beta + (9.408357)*sailStates.p + (-141.871536)*sailStates.q + (-1.501183)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.198795)*sailStates.alpha + (-0.003691)*sailStates.beta + (0.343338)*sailStates.p + (-2.314756)*sailStates.q + (-0.046297)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end