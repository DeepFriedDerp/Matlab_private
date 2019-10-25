function [aeroForces] = paramSpace_1_1_1_3_1_2_2(sailStates,airStates)

	CL = (3.782744)*sailStates.alpha + (-0.171155)*sailStates.beta + (-2.497917)*sailStates.p + (34.989605)*sailStates.q + (-0.759485)*sailStates.r + (0.010504)*sailStates.de;
	CD = 0.086020;
	CY = (-0.061222)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.137879)*sailStates.p + (-0.491626)*sailStates.q + (-0.024265)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.228441)*sailStates.alpha + (0.042775)*sailStates.beta + (-1.216703)*sailStates.p + (10.331500)*sailStates.q + (-0.535498)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-13.543376)*sailStates.alpha + (0.691308)*sailStates.beta + (8.398405)*sailStates.p + (-135.234573)*sailStates.q + (2.598624)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.209353)*sailStates.alpha + (0.011075)*sailStates.beta + (0.129108)*sailStates.p + (0.588692)*sailStates.q + (-0.034111)*sailStates.r + (0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end