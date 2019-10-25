function [aeroForces] = paramSpace_2_4_1_1_2_1_1(sailStates,airStates)

	CL = (6.143511)*sailStates.alpha + (0.603083)*sailStates.beta + (-1.720160)*sailStates.p + (30.218565)*sailStates.q + (-2.447953)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.347500;
	CY = (0.379014)*sailStates.alpha + (-0.025093)*sailStates.beta + (-1.111065)*sailStates.p + (-0.221998)*sailStates.q + (-0.072800)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.159005)*sailStates.alpha + (0.713594)*sailStates.beta + (-0.445497)*sailStates.p + (3.104664)*sailStates.q + (-2.242361)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-12.217861)*sailStates.alpha + (-2.430159)*sailStates.beta + (5.238829)*sailStates.p + (-111.854546)*sailStates.q + (8.327000)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.123226)*sailStates.alpha + (0.033188)*sailStates.beta + (2.468046)*sailStates.p + (-10.940182)*sailStates.q + (0.016315)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end