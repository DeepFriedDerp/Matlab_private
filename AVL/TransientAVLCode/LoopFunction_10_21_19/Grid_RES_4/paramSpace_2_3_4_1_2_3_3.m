function [aeroForces] = paramSpace_2_3_4_1_2_3_3(sailStates,airStates)

	CL = (5.933066)*sailStates.alpha + (-0.155499)*sailStates.beta + (-3.393869)*sailStates.p + (39.452354)*sailStates.q + (1.787561)*sailStates.r + (0.011006)*sailStates.de;
	CD = -2.220220;
	CY = (0.379337)*sailStates.alpha + (-0.024921)*sailStates.beta + (0.961297)*sailStates.p + (0.221997)*sailStates.q + (0.063030)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.918456)*sailStates.alpha + (-0.527714)*sailStates.beta + (-1.896307)*sailStates.p + (15.587863)*sailStates.q + (1.793700)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-14.428025)*sailStates.alpha + (0.646814)*sailStates.beta + (12.209542)*sailStates.p + (-161.490479)*sailStates.q + (-6.101702)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.012658)*sailStates.alpha + (-0.030827)*sailStates.beta + (-2.262229)*sailStates.p + (10.424161)*sailStates.q + (-0.022987)*sailStates.r + (0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end