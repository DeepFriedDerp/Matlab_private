function [aeroForces] = paramSpace_2_2_4_1_2_3_3(sailStates,airStates)

	CL = (5.933066)*sailStates.alpha + (0.155499)*sailStates.beta + (-3.393870)*sailStates.p + (39.452362)*sailStates.q + (1.787561)*sailStates.r + (0.011006)*sailStates.de;
	CD = -2.220220;
	CY = (0.379337)*sailStates.alpha + (-0.025032)*sailStates.beta + (0.961297)*sailStates.p + (0.221997)*sailStates.q + (0.063030)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.959697)*sailStates.alpha + (-0.450699)*sailStates.beta + (-1.928958)*sailStates.p + (15.991749)*sailStates.q + (1.791602)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-14.428025)*sailStates.alpha + (-0.646814)*sailStates.beta + (12.209541)*sailStates.p + (-161.490479)*sailStates.q + (-6.101702)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.052853)*sailStates.alpha + (-0.033302)*sailStates.beta + (-2.264369)*sailStates.p + (10.450633)*sailStates.q + (-0.023125)*sailStates.r + (0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end