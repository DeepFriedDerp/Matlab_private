function [aeroForces] = paramSpace_1_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.527419)*sailStates.alpha + (-0.347829)*sailStates.beta + (-2.555669)*sailStates.p + (38.152866)*sailStates.q + (-1.882658)*sailStates.r + (0.011343)*sailStates.de;
	CD = -0.482190;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.648254)*sailStates.p + (0.000002)*sailStates.q + (-0.114305)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.445497)*sailStates.alpha + (0.212137)*sailStates.beta + (-1.231311)*sailStates.p + (11.195580)*sailStates.q + (-1.523968)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-12.778211)*sailStates.alpha + (1.238121)*sailStates.beta + (7.676401)*sailStates.p + (-134.612778)*sailStates.q + (6.255179)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.002232)*sailStates.alpha + (0.057957)*sailStates.beta + (1.302937)*sailStates.p + (-5.297546)*sailStates.q + (-0.000881)*sailStates.r + (-0.000124)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end