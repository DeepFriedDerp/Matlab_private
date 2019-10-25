function [aeroForces] = paramSpace_3_1_4_2_2_3_2(sailStates,airStates)

	CL = (4.524043)*sailStates.alpha + (0.336643)*sailStates.beta + (-2.573090)*sailStates.p + (35.935211)*sailStates.q + (1.353160)*sailStates.r + (0.011070)*sailStates.de;
	CD = -0.481070;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.574170)*sailStates.p + (-0.000000)*sailStates.q + (-0.037633)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.458074)*sailStates.alpha + (-0.195546)*sailStates.beta + (-1.255838)*sailStates.p + (10.636374)*sailStates.q + (1.210056)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-13.906978)*sailStates.alpha + (-1.378280)*sailStates.beta + (8.460855)*sailStates.p + (-136.150452)*sailStates.q + (-4.617644)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.087012)*sailStates.alpha + (0.019852)*sailStates.beta + (-1.201471)*sailStates.p + (5.072772)*sailStates.q + (0.004516)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end