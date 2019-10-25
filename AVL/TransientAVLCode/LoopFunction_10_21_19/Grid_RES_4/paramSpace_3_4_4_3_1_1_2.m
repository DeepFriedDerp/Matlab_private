function [aeroForces] = paramSpace_3_4_4_3_1_1_2(sailStates,airStates)

	CL = (4.060989)*sailStates.alpha + (0.033021)*sailStates.beta + (-2.524728)*sailStates.p + (33.974174)*sailStates.q + (-0.178476)*sailStates.r + (0.010671)*sailStates.de;
	CD = -0.082850;
	CY = (-0.061056)*sailStates.alpha + (-0.024097)*sailStates.beta + (-0.130477)*sailStates.p + (-0.498142)*sailStates.q + (0.008499)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.155811)*sailStates.alpha + (0.097180)*sailStates.beta + (-1.141314)*sailStates.p + (8.911501)*sailStates.q + (-0.244869)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.572161)*sailStates.alpha + (-0.080206)*sailStates.beta + (8.772834)*sailStates.p + (-135.916275)*sailStates.q + (0.580402)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.085707)*sailStates.alpha + (-0.005037)*sailStates.beta + (0.389800)*sailStates.p + (-1.739664)*sailStates.q + (-0.004762)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end