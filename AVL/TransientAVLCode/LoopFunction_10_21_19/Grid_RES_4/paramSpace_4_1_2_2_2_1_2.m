function [aeroForces] = paramSpace_4_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.125663)*sailStates.alpha + (-0.043280)*sailStates.beta + (-2.384420)*sailStates.p + (31.387127)*sailStates.q + (-0.048046)*sailStates.r + (0.009809)*sailStates.de;
	CD = -0.319880;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.255868)*sailStates.p + (-0.000000)*sailStates.q + (0.050895)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.314206)*sailStates.alpha + (0.124950)*sailStates.beta + (-1.177181)*sailStates.p + (9.473162)*sailStates.q + (-0.278595)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.952626)*sailStates.alpha + (0.237919)*sailStates.beta + (8.782891)*sailStates.p + (-133.820877)*sailStates.q + (0.097439)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.305146)*sailStates.alpha + (-0.033194)*sailStates.beta + (0.780495)*sailStates.p + (-4.229451)*sailStates.q + (-0.053308)*sailStates.r + (-0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end