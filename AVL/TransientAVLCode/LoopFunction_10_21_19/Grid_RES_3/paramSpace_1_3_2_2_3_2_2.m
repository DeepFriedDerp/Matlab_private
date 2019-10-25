function [aeroForces] = paramSpace_1_3_2_2_3_2_2(sailStates,airStates)

	CL = (3.972993)*sailStates.alpha + (0.186512)*sailStates.beta + (-2.465764)*sailStates.p + (35.115395)*sailStates.q + (-1.069962)*sailStates.r + (0.010602)*sailStates.de;
	CD = 0.028470;
	CY = (0.097493)*sailStates.alpha + (-0.022918)*sailStates.beta + (-0.318139)*sailStates.p + (0.759372)*sailStates.q + (-0.056097)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.224189)*sailStates.alpha + (0.188174)*sailStates.beta + (-1.111953)*sailStates.p + (9.326013)*sailStates.q + (-0.753082)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-13.815580)*sailStates.alpha + (-0.665729)*sailStates.beta + (8.028678)*sailStates.p + (-133.652283)*sailStates.q + (3.580610)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.052131)*sailStates.alpha + (0.021862)*sailStates.beta + (0.533413)*sailStates.p + (-2.420877)*sailStates.q + (-0.004162)*sailStates.r + (-0.000256)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end