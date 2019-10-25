function [aeroForces] = paramSpace_1_2_3_3_1_1_1(sailStates,airStates)

	CL = (4.127527)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.308186)*sailStates.p + (35.055580)*sailStates.q + (-1.312305)*sailStates.r + (0.011147)*sailStates.de;
	CD = -0.131730;
	CY = (-0.045101)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.377116)*sailStates.p + (-0.665001)*sailStates.q + (-0.066559)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.084152)*sailStates.alpha + (0.215090)*sailStates.beta + (-0.989896)*sailStates.p + (8.430415)*sailStates.q + (-1.008569)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-13.243237)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.268983)*sailStates.p + (-129.097870)*sailStates.q + (4.373430)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.098843)*sailStates.alpha + (0.037926)*sailStates.beta + (0.749580)*sailStates.p + (-2.537654)*sailStates.q + (-0.014998)*sailStates.r + (0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end