function [aeroForces] = paramSpace_3_4_3_2_3_3_3(sailStates,airStates)

	CL = (4.248419)*sailStates.alpha + (-0.294671)*sailStates.beta + (-2.983260)*sailStates.p + (39.134972)*sailStates.q + (1.196617)*sailStates.r + (0.011303)*sailStates.de;
	CD = -0.369400;
	CY = (0.160127)*sailStates.alpha + (-0.025570)*sailStates.beta + (0.451288)*sailStates.p + (0.668510)*sailStates.q + (-0.029555)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.269122)*sailStates.alpha + (-0.329482)*sailStates.beta + (-1.491637)*sailStates.p + (12.462491)*sailStates.q + (1.058914)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-13.472375)*sailStates.alpha + (1.172073)*sailStates.beta + (9.895021)*sailStates.p + (-147.557632)*sailStates.q + (-4.075313)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.283268)*sailStates.alpha + (0.016434)*sailStates.beta + (-0.942470)*sailStates.p + (3.439642)*sailStates.q + (-0.001303)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end