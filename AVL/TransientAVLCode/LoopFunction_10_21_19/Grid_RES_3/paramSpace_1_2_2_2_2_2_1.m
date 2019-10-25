function [aeroForces] = paramSpace_1_2_2_2_2_2_1(sailStates,airStates)

	CL = (3.873684)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.111835)*sailStates.p + (31.950012)*sailStates.q + (-0.741505)*sailStates.r + (0.010566)*sailStates.de;
	CD = 0.053340;
	CY = (-0.007110)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.155561)*sailStates.p + (-0.267957)*sailStates.q + (-0.027430)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (0.991438)*sailStates.alpha + (0.088469)*sailStates.beta + (-0.854193)*sailStates.p + (6.828556)*sailStates.q + (-0.490689)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-13.795940)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.043768)*sailStates.p + (-124.628265)*sailStates.q + (2.501556)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.010865)*sailStates.alpha + (0.015600)*sailStates.beta + (0.241463)*sailStates.p + (-0.538617)*sailStates.q + (-0.017387)*sailStates.r + (0.000061)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end