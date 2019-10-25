function [aeroForces] = paramSpace_9_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.158351)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.372101)*sailStates.p + (33.559437)*sailStates.q + (0.579554)*sailStates.r + (0.011091)*sailStates.de;
	CD = -0.070260;
	CY = (0.037330)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.201063)*sailStates.p + (0.438541)*sailStates.q + (-0.007067)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.151132)*sailStates.alpha + (-0.118285)*sailStates.beta + (-1.041763)*sailStates.p + (8.249268)*sailStates.q + (0.488756)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.637600)*sailStates.alpha + (0.000000)*sailStates.beta + (8.063075)*sailStates.p + (-131.751755)*sailStates.q + (-1.944916)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (0.089471)*sailStates.alpha + (0.004131)*sailStates.beta + (-0.451700)*sailStates.p + (1.771955)*sailStates.q + (-0.000209)*sailStates.r + (-0.000074)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end