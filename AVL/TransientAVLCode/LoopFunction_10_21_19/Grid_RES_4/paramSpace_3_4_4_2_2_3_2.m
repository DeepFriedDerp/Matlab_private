function [aeroForces] = paramSpace_3_4_4_2_2_3_2(sailStates,airStates)

	CL = (4.524043)*sailStates.alpha + (-0.336644)*sailStates.beta + (-2.573090)*sailStates.p + (35.935211)*sailStates.q + (1.353161)*sailStates.r + (0.011070)*sailStates.de;
	CD = -0.481070;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.574170)*sailStates.p + (-0.000000)*sailStates.q + (-0.037633)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.313746)*sailStates.alpha + (-0.372039)*sailStates.beta + (-1.158150)*sailStates.p + (9.427816)*sailStates.q + (1.203526)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-13.906978)*sailStates.alpha + (1.378280)*sailStates.beta + (8.460855)*sailStates.p + (-136.150452)*sailStates.q + (-4.617644)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.171738)*sailStates.alpha + (0.017350)*sailStates.beta + (-1.207874)*sailStates.p + (5.151985)*sailStates.q + (0.004944)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end