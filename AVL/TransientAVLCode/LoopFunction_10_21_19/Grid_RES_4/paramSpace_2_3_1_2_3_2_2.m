function [aeroForces] = paramSpace_2_3_1_2_3_2_2(sailStates,airStates)

	CL = (4.087346)*sailStates.alpha + (0.043385)*sailStates.beta + (-2.558552)*sailStates.p + (35.036358)*sailStates.q + (-0.547560)*sailStates.r + (0.010994)*sailStates.de;
	CD = 0.024740;
	CY = (0.096961)*sailStates.alpha + (-0.024620)*sailStates.beta + (-0.222456)*sailStates.p + (0.769435)*sailStates.q + (-0.014662)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.283563)*sailStates.alpha + (0.091884)*sailStates.beta + (-1.186714)*sailStates.p + (9.599244)*sailStates.q + (-0.427709)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.649824)*sailStates.alpha + (-0.185027)*sailStates.beta + (8.663335)*sailStates.p + (-136.832825)*sailStates.q + (1.877010)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.091443)*sailStates.alpha + (0.004896)*sailStates.beta + (0.391488)*sailStates.p + (-1.990539)*sailStates.q + (0.002570)*sailStates.r + (-0.000235)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end