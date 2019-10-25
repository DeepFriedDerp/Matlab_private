function [aeroForces] = paramSpace_10_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.143460)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.770525)*sailStates.p + (36.059601)*sailStates.q + (-0.244314)*sailStates.r + (0.010973)*sailStates.de;
	CD = -0.091070;
	CY = (0.024824)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.207238)*sailStates.p + (0.351849)*sailStates.q + (0.014529)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.392792)*sailStates.alpha + (0.089403)*sailStates.beta + (-1.380955)*sailStates.p + (11.233325)*sailStates.q + (-0.284822)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.833423)*sailStates.alpha + (0.000000)*sailStates.beta + (9.640233)*sailStates.p + (-143.366257)*sailStates.q + (0.789857)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (-0.134907)*sailStates.alpha + (-0.006252)*sailStates.beta + (0.556655)*sailStates.p + (-3.225900)*sailStates.q + (-0.012565)*sailStates.r + (-0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end