function [aeroForces] = paramSpace_4_1_3_2_3_2_2(sailStates,airStates)

	CL = (3.740591)*sailStates.alpha + (0.187570)*sailStates.beta + (-2.483233)*sailStates.p + (34.913139)*sailStates.q + (0.789530)*sailStates.r + (0.010435)*sailStates.de;
	CD = 0.083040;
	CY = (0.093556)*sailStates.alpha + (-0.022301)*sailStates.beta + (0.107007)*sailStates.p + (0.756270)*sailStates.q + (-0.021258)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.204897)*sailStates.alpha + (-0.029926)*sailStates.beta + (-1.215134)*sailStates.p + (10.387052)*sailStates.q + (0.534346)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-13.432720)*sailStates.alpha + (-0.712376)*sailStates.beta + (8.363423)*sailStates.p + (-134.899979)*sailStates.q + (-2.688079)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.266635)*sailStates.alpha + (0.009501)*sailStates.beta + (-0.054022)*sailStates.p + (-1.157655)*sailStates.q + (-0.047532)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end