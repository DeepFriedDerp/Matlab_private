function [aeroForces] = paramSpace_1_3_1_3_1_3_2(sailStates,airStates)

	CL = (3.947164)*sailStates.alpha + (0.034687)*sailStates.beta + (-2.453320)*sailStates.p + (32.916340)*sailStates.q + (-0.100144)*sailStates.r + (0.010094)*sailStates.de;
	CD = -0.095060;
	CY = (-0.058335)*sailStates.alpha + (-0.026191)*sailStates.beta + (0.166418)*sailStates.p + (-0.491627)*sailStates.q + (0.029391)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.181474)*sailStates.alpha + (-0.059172)*sailStates.beta + (-1.117971)*sailStates.p + (8.723246)*sailStates.q + (0.092161)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-14.451215)*sailStates.alpha + (-0.167364)*sailStates.beta + (8.783294)*sailStates.p + (-135.234604)*sailStates.q + (0.415814)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.303441)*sailStates.alpha + (-0.004811)*sailStates.beta + (-0.546167)*sailStates.p + (3.506001)*sailStates.q + (-0.045551)*sailStates.r + (0.000200)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end