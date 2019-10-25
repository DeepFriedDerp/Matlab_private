function [aeroForces] = paramSpace_4_1_2_3_1_2_3(sailStates,airStates)

	CL = (3.869700)*sailStates.alpha + (0.225195)*sailStates.beta + (-2.697894)*sailStates.p + (37.206882)*sailStates.q + (1.200699)*sailStates.r + (0.010640)*sailStates.de;
	CD = 0.048030;
	CY = (-0.052123)*sailStates.alpha + (-0.026893)*sailStates.beta + (0.321549)*sailStates.p + (-0.684402)*sailStates.q + (-0.063936)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.397039)*sailStates.alpha + (-0.050146)*sailStates.beta + (-1.398393)*sailStates.p + (12.431465)*sailStates.q + (0.855249)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-13.514635)*sailStates.alpha + (-0.773118)*sailStates.beta + (8.756246)*sailStates.p + (-140.146637)*sailStates.q + (-4.003565)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.190123)*sailStates.alpha + (0.024633)*sailStates.beta + (-0.473664)*sailStates.p + (1.717069)*sailStates.q + (-0.020645)*sailStates.r + (0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end