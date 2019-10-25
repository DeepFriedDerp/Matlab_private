function [aeroForces] = paramSpace_1_3_4_1_2_2_3(sailStates,airStates)

	CL = (3.576752)*sailStates.alpha + (0.073829)*sailStates.beta + (-3.333831)*sailStates.p + (42.472679)*sailStates.q + (-1.314422)*sailStates.r + (0.011223)*sailStates.de;
	CD = 0.078320;
	CY = (-0.030121)*sailStates.alpha + (-0.024341)*sailStates.beta + (-0.304883)*sailStates.p + (0.662188)*sailStates.q + (-0.060574)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.305380)*sailStates.alpha + (0.157044)*sailStates.beta + (-1.847521)*sailStates.p + (16.442080)*sailStates.q + (-0.918497)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-12.860339)*sailStates.alpha + (-0.232846)*sailStates.beta + (10.940761)*sailStates.p + (-158.727356)*sailStates.q + (4.368035)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.486057)*sailStates.alpha + (0.026480)*sailStates.beta + (0.358851)*sailStates.p + (-0.877322)*sailStates.q + (-0.038634)*sailStates.r + (-0.000260)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end