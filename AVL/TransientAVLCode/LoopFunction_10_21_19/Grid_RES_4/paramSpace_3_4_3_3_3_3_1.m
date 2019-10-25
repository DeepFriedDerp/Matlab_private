function [aeroForces] = paramSpace_3_4_3_3_3_3_1(sailStates,airStates)

	CL = (4.121759)*sailStates.alpha + (-0.209233)*sailStates.beta + (-2.308820)*sailStates.p + (33.356022)*sailStates.q + (0.823377)*sailStates.r + (0.010893)*sailStates.de;
	CD = -0.140360;
	CY = (0.038448)*sailStates.alpha + (-0.025447)*sailStates.beta + (0.299669)*sailStates.p + (0.563442)*sailStates.q + (-0.019622)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.015396)*sailStates.alpha + (-0.222851)*sailStates.beta + (-0.945864)*sailStates.p + (7.332993)*sailStates.q + (0.711832)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-13.980000)*sailStates.alpha + (0.838004)*sailStates.beta + (7.731895)*sailStates.p + (-129.238022)*sailStates.q + (-2.808619)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.159873)*sailStates.alpha + (0.011251)*sailStates.beta + (-0.634367)*sailStates.p + (2.285415)*sailStates.q + (-0.001082)*sailStates.r + (-0.000115)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end