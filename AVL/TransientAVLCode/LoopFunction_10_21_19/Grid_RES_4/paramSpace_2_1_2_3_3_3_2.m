function [aeroForces] = paramSpace_2_1_2_3_3_3_2(sailStates,airStates)

	CL = (4.088918)*sailStates.alpha + (0.054285)*sailStates.beta + (-2.524966)*sailStates.p + (33.957722)*sailStates.q + (0.187084)*sailStates.r + (0.010701)*sailStates.de;
	CD = -0.101900;
	CY = (0.061054)*sailStates.alpha + (-0.025370)*sailStates.beta + (0.145330)*sailStates.p + (0.498142)*sailStates.q + (0.009508)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.305386)*sailStates.alpha + (-0.080347)*sailStates.beta + (-1.239124)*sailStates.p + (10.119314)*sailStates.q + (0.262146)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.637291)*sailStates.alpha + (-0.216447)*sailStates.beta + (8.776120)*sailStates.p + (-135.916275)*sailStates.q + (-0.630535)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.071007)*sailStates.alpha + (-0.006687)*sailStates.beta + (-0.418160)*sailStates.p + (1.830372)*sailStates.q + (-0.004897)*sailStates.r + (-0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end