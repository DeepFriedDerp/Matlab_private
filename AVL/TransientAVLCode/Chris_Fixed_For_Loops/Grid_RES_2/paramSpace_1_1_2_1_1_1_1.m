function [aeroForces] = paramSpace_1_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.520706)*sailStates.alpha + (0.520395)*sailStates.beta + (-5.129553)*sailStates.p + (50.139145)*sailStates.q + (1.615984)*sailStates.r + (0.010800)*sailStates.de;
	CD = -4.193060;
	CY = (1.506717)*sailStates.alpha + (-0.030563)*sailStates.beta + (0.979284)*sailStates.p + (3.009610)*sailStates.q + (0.129138)*sailStates.r + (0.000672)*sailStates.de;

	Cl = (0.180437)*sailStates.alpha + (-0.518847)*sailStates.beta + (-3.464250)*sailStates.p + (29.993370)*sailStates.q + (1.809641)*sailStates.r + (0.004286)*sailStates.de;
	Cm = (-3.233813)*sailStates.alpha + (-2.197190)*sailStates.beta + (18.932423)*sailStates.p + (-211.854324)*sailStates.q + (-5.460547)*sailStates.r + (-0.077908)*sailStates.de;
	Cn = (-5.295004)*sailStates.alpha + (-0.089202)*sailStates.beta + (-2.731548)*sailStates.p + (11.978693)*sailStates.q + (-0.061889)*sailStates.r + (-0.000561)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end