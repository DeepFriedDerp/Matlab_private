function [aeroForces] = paramSpace_3_4_2_3_2_1_2(sailStates,airStates)

	CL = (4.164870)*sailStates.alpha + (0.093709)*sailStates.beta + (-2.530221)*sailStates.p + (33.913769)*sailStates.q + (-0.325854)*sailStates.r + (0.010732)*sailStates.de;
	CD = -0.153930;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.240722)*sailStates.p + (-0.000000)*sailStates.q + (0.015778)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.198269)*sailStates.alpha + (0.141435)*sailStates.beta + (-1.144670)*sailStates.p + (8.901296)*sailStates.q + (-0.398625)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.799392)*sailStates.alpha + (-0.414249)*sailStates.beta + (8.836597)*sailStates.p + (-136.150452)*sailStates.q + (1.115082)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.170997)*sailStates.alpha + (-0.006528)*sailStates.beta + (0.599084)*sailStates.p + (-2.881186)*sailStates.q + (-0.008263)*sailStates.r + (-0.000045)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end