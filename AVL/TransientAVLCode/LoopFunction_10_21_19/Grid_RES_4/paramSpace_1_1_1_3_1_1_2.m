function [aeroForces] = paramSpace_1_1_1_3_1_1_2(sailStates,airStates)

	CL = (3.947428)*sailStates.alpha + (-0.371085)*sailStates.beta + (-2.524573)*sailStates.p + (37.334591)*sailStates.q + (-1.527565)*sailStates.r + (0.010805)*sailStates.de;
	CD = -0.116060;
	CY = (-0.064265)*sailStates.alpha + (-0.023075)*sailStates.beta + (-0.466797)*sailStates.p + (-0.489617)*sailStates.q + (-0.092799)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.235526)*sailStates.alpha + (0.149444)*sailStates.beta + (-1.225681)*sailStates.p + (11.018131)*sailStates.q + (-1.226989)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-12.198310)*sailStates.alpha + (1.462021)*sailStates.beta + (7.830014)*sailStates.p + (-134.519470)*sailStates.q + (5.131108)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.147529)*sailStates.alpha + (0.046870)*sailStates.beta + (0.854655)*sailStates.p + (-2.551842)*sailStates.q + (-0.025944)*sailStates.r + (0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end