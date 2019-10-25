function [aeroForces] = paramSpace_1_3_2_1_1_3_2(sailStates,airStates)

	CL = (6.733450)*sailStates.alpha + (-0.354740)*sailStates.beta + (-2.377942)*sailStates.p + (27.698723)*sailStates.q + (1.800302)*sailStates.r + (0.009216)*sailStates.de;
	CD = -2.613050;
	CY = (-0.168650)*sailStates.alpha + (-0.029042)*sailStates.beta + (1.105956)*sailStates.p + (-1.671348)*sailStates.q + (0.195010)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (2.379581)*sailStates.alpha + (-0.589207)*sailStates.beta + (-1.103792)*sailStates.p + (7.349217)*sailStates.q + (1.845836)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-18.069942)*sailStates.alpha + (1.375330)*sailStates.beta + (10.080256)*sailStates.p + (-136.726761)*sailStates.q + (-5.888284)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.905403)*sailStates.alpha + (-0.069387)*sailStates.beta + (-2.630007)*sailStates.p + (13.663996)*sailStates.q + (-0.103952)*sailStates.r + (0.000691)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end