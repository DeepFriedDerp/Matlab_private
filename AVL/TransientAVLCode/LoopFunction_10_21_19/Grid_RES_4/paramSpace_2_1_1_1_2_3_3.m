function [aeroForces] = paramSpace_2_1_1_1_2_3_3(sailStates,airStates)

	CL = (5.744815)*sailStates.alpha + (0.400709)*sailStates.beta + (-3.373365)*sailStates.p + (39.236538)*sailStates.q + (1.760013)*sailStates.r + (0.010746)*sailStates.de;
	CD = -2.121280;
	CY = (0.362639)*sailStates.alpha + (-0.025093)*sailStates.beta + (0.916418)*sailStates.p + (0.221994)*sailStates.q + (0.060042)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.971697)*sailStates.alpha + (-0.354044)*sailStates.beta + (-1.951831)*sailStates.p + (16.321831)*sailStates.q + (1.717129)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-13.993996)*sailStates.alpha + (-1.519829)*sailStates.beta + (12.131267)*sailStates.p + (-160.446365)*sailStates.q + (-5.932824)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.040123)*sailStates.alpha + (-0.034711)*sailStates.beta + (-2.200138)*sailStates.p + (10.444782)*sailStates.q + (-0.023426)*sailStates.r + (0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end