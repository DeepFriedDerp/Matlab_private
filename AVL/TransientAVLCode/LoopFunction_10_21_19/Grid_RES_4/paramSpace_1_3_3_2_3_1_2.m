function [aeroForces] = paramSpace_1_3_3_2_3_1_2(sailStates,airStates)

	CL = (4.847700)*sailStates.alpha + (0.153591)*sailStates.beta + (-2.535396)*sailStates.p + (38.984699)*sailStates.q + (-2.198486)*sailStates.r + (0.011388)*sailStates.de;
	CD = -0.637210;
	CY = (0.106009)*sailStates.alpha + (-0.024198)*sailStates.beta + (-0.803325)*sailStates.p + (0.756272)*sailStates.q + (-0.159764)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.634437)*sailStates.alpha + (0.418744)*sailStates.beta + (-1.158019)*sailStates.p + (10.697706)*sailStates.q + (-1.769886)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-12.738751)*sailStates.alpha + (-0.558291)*sailStates.beta + (7.248608)*sailStates.p + (-133.768066)*sailStates.q + (7.277059)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.180552)*sailStates.alpha + (0.072239)*sailStates.beta + (1.620647)*sailStates.p + (-7.216927)*sailStates.q + (0.016072)*sailStates.r + (-0.000351)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end