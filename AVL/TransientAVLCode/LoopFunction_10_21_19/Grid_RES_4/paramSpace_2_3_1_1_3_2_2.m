function [aeroForces] = paramSpace_2_3_1_1_3_2_2(sailStates,airStates)

	CL = (4.232170)*sailStates.alpha + (0.054567)*sailStates.beta + (-2.549255)*sailStates.p + (35.087376)*sailStates.q + (-0.788895)*sailStates.r + (0.010992)*sailStates.de;
	CD = -0.029660;
	CY = (0.215217)*sailStates.alpha + (-0.024193)*sailStates.beta + (-0.371840)*sailStates.p + (1.693498)*sailStates.q + (-0.024550)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.411925)*sailStates.alpha + (0.134457)*sailStates.beta + (-1.180925)*sailStates.p + (9.615386)*sailStates.q + (-0.624871)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-14.871706)*sailStates.alpha + (-0.223161)*sailStates.beta + (8.557268)*sailStates.p + (-136.398376)*sailStates.q + (2.682546)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.250535)*sailStates.alpha + (0.006753)*sailStates.beta + (0.698259)*sailStates.p + (-4.065446)*sailStates.q + (0.009873)*sailStates.r + (-0.000524)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end