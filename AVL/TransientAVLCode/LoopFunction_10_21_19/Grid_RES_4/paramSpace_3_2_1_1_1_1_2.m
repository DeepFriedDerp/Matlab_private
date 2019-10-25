function [aeroForces] = paramSpace_3_2_1_1_1_1_2(sailStates,airStates)

	CL = (5.497983)*sailStates.alpha + (-0.140116)*sailStates.beta + (-2.491996)*sailStates.p + (32.378464)*sailStates.q + (-1.459168)*sailStates.r + (0.010548)*sailStates.de;
	CD = -1.746690;
	CY = (-0.202565)*sailStates.alpha + (-0.025401)*sailStates.beta + (-0.723016)*sailStates.p + (-1.693500)*sailStates.q + (0.047568)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.184441)*sailStates.alpha + (0.397666)*sailStates.beta + (-1.195598)*sailStates.p + (9.314898)*sailStates.q + (-1.523876)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.692769)*sailStates.alpha + (0.593688)*sailStates.beta + (9.060825)*sailStates.p + (-136.398376)*sailStates.q + (5.000261)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.174817)*sailStates.alpha + (-0.028796)*sailStates.beta + (1.727810)*sailStates.p + (-6.707515)*sailStates.q + (-0.008872)*sailStates.r + (0.000355)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end