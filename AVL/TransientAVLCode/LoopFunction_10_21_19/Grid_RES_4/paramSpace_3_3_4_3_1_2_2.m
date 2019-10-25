function [aeroForces] = paramSpace_3_3_4_3_1_2_2(sailStates,airStates)

	CL = (4.060456)*sailStates.alpha + (-0.040102)*sailStates.beta + (-2.561282)*sailStates.p + (35.021389)*sailStates.q + (0.476707)*sailStates.r + (0.010994)*sailStates.de;
	CD = 0.034220;
	CY = (-0.062618)*sailStates.alpha + (-0.024746)*sailStates.beta + (0.178599)*sailStates.p + (-0.498142)*sailStates.q + (-0.011759)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.259164)*sailStates.alpha + (-0.079385)*sailStates.beta + (-1.188414)*sailStates.p + (9.594503)*sailStates.q + (0.369825)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.615215)*sailStates.alpha + (0.173832)*sailStates.beta + (8.694474)*sailStates.p + (-136.960373)*sailStates.q + (-1.640515)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.045122)*sailStates.alpha + (0.004350)*sailStates.beta + (-0.301424)*sailStates.p + (1.381373)*sailStates.q + (0.000426)*sailStates.r + (0.000150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end