function [aeroForces] = paramSpace_1_1_1_2_1_3_2(sailStates,airStates)

	CL = (4.162391)*sailStates.alpha + (0.030109)*sailStates.beta + (-2.405372)*sailStates.p + (31.359102)*sailStates.q + (0.225016)*sailStates.r + (0.009640)*sailStates.de;
	CD = -0.371140;
	CY = (-0.085805)*sailStates.alpha + (-0.022144)*sailStates.beta + (0.347306)*sailStates.p + (-0.756269)*sailStates.q + (0.069165)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.425911)*sailStates.alpha + (-0.129378)*sailStates.beta + (-1.190363)*sailStates.p + (9.438170)*sailStates.q + (0.390803)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-14.879848)*sailStates.alpha + (-0.063198)*sailStates.beta + (9.022448)*sailStates.p + (-134.899979)*sailStates.q + (-0.625055)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.429748)*sailStates.alpha + (-0.040352)*sailStates.beta + (-0.990679)*sailStates.p + (5.928002)*sailStates.q + (-0.072571)*sailStates.r + (0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end