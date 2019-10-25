function [aeroForces] = paramSpace_3_4_3_3_1_1_2(sailStates,airStates)

	CL = (4.088918)*sailStates.alpha + (0.054285)*sailStates.beta + (-2.524966)*sailStates.p + (33.957718)*sailStates.q + (-0.187084)*sailStates.r + (0.010701)*sailStates.de;
	CD = -0.101900;
	CY = (-0.061054)*sailStates.alpha + (-0.024202)*sailStates.beta + (-0.145330)*sailStates.p + (-0.498142)*sailStates.q + (0.009508)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.154084)*sailStates.alpha + (0.105079)*sailStates.beta + (-1.141431)*sailStates.p + (8.910748)*sailStates.q + (-0.268592)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.637291)*sailStates.alpha + (-0.216447)*sailStates.beta + (8.776120)*sailStates.p + (-135.916275)*sailStates.q + (0.630535)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.085419)*sailStates.alpha + (-0.005466)*sailStates.beta + (0.411756)*sailStates.p + (-1.751158)*sailStates.q + (-0.004474)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end