function [aeroForces] = paramSpace_2_4_1_1_1_2_2(sailStates,airStates)

	CL = (4.042774)*sailStates.alpha + (0.039863)*sailStates.beta + (-2.563804)*sailStates.p + (34.634056)*sailStates.q + (0.098317)*sailStates.r + (0.010831)*sailStates.de;
	CD = 0.002540;
	CY = (-0.206975)*sailStates.alpha + (-0.027130)*sailStates.beta + (0.176446)*sailStates.p + (-1.693497)*sailStates.q + (0.011744)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.215462)*sailStates.alpha + (-0.026921)*sailStates.beta + (-1.160429)*sailStates.p + (9.079387)*sailStates.q + (0.101982)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-14.622733)*sailStates.alpha + (-0.246036)*sailStates.beta + (8.879431)*sailStates.p + (-136.946671)*sailStates.q + (-0.279188)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.318349)*sailStates.alpha + (0.002314)*sailStates.beta + (-0.425054)*sailStates.p + (3.515303)*sailStates.q + (-0.016726)*sailStates.r + (0.000533)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end