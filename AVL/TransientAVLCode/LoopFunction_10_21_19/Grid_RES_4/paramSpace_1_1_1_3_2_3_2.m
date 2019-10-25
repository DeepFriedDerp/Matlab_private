function [aeroForces] = paramSpace_1_1_1_3_2_3_2(sailStates,airStates)

	CL = (3.816514)*sailStates.alpha + (-0.080875)*sailStates.beta + (-2.410341)*sailStates.p + (32.756668)*sailStates.q + (-0.330004)*sailStates.r + (0.009886)*sailStates.de;
	CD = -0.032080;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.061527)*sailStates.p + (0.000000)*sailStates.q + (0.012239)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.261398)*sailStates.alpha + (-0.053678)*sailStates.beta + (-1.185106)*sailStates.p + (9.813691)*sailStates.q + (-0.103278)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.070379)*sailStates.alpha + (0.346007)*sailStates.beta + (8.527257)*sailStates.p + (-133.820877)*sailStates.q + (1.187720)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.245906)*sailStates.alpha + (-0.012733)*sailStates.beta + (-0.360323)*sailStates.p + (2.517495)*sailStates.q + (-0.045566)*sailStates.r + (0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end