function [aeroForces] = paramSpace_1_2_2_3_3_1_1(sailStates,airStates)

	CL = (4.344376)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.281452)*sailStates.p + (35.257477)*sailStates.q + (-1.576314)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.253090;
	CY = (0.103965)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.553392)*sailStates.p + (0.318253)*sailStates.q + (-0.097578)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.290403)*sailStates.alpha + (0.264001)*sailStates.beta + (-0.973359)*sailStates.p + (8.478683)*sailStates.q + (-1.247180)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-13.169064)*sailStates.alpha + (0.000000)*sailStates.beta + (6.958228)*sailStates.p + (-127.854218)*sailStates.q + (5.259558)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.328918)*sailStates.alpha + (0.046551)*sailStates.beta + (1.107512)*sailStates.p + (-4.782946)*sailStates.q + (0.005636)*sailStates.r + (-0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end