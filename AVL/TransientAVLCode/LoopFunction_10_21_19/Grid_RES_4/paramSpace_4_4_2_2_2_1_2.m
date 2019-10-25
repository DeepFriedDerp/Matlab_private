function [aeroForces] = paramSpace_4_4_2_2_2_1_2(sailStates,airStates)

	CL = (4.125663)*sailStates.alpha + (0.043280)*sailStates.beta + (-2.384420)*sailStates.p + (31.387127)*sailStates.q + (-0.048046)*sailStates.r + (0.009809)*sailStates.de;
	CD = -0.319880;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.255868)*sailStates.p + (-0.000000)*sailStates.q + (0.050895)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.163015)*sailStates.alpha + (0.132387)*sailStates.beta + (-1.082792)*sailStates.p + (8.285281)*sailStates.q + (-0.297327)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-14.952628)*sailStates.alpha + (-0.237919)*sailStates.beta + (8.782891)*sailStates.p + (-133.820877)*sailStates.q + (0.097439)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.309791)*sailStates.alpha + (-0.017994)*sailStates.beta + (0.761720)*sailStates.p + (-3.993167)*sailStates.q + (-0.049582)*sailStates.r + (-0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end