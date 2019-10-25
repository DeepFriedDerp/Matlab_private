function [aeroForces] = paramSpace_3_2_1_3_3_1_1(sailStates,airStates)

	CL = (4.301395)*sailStates.alpha + (-0.045942)*sailStates.beta + (-2.294746)*sailStates.p + (32.027447)*sailStates.q + (-0.495788)*sailStates.r + (0.010807)*sailStates.de;
	CD = -0.212090;
	CY = (0.106321)*sailStates.alpha + (-0.024835)*sailStates.beta + (-0.346172)*sailStates.p + (0.563442)*sailStates.q + (0.022630)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.253942)*sailStates.alpha + (0.139111)*sailStates.beta + (-1.009686)*sailStates.p + (7.799838)*sailStates.q + (-0.550575)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-15.211227)*sailStates.alpha + (0.209386)*sailStates.beta + (8.094763)*sailStates.p + (-130.282166)*sailStates.q + (1.702285)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.386040)*sailStates.alpha + (-0.010427)*sailStates.beta + (0.797723)*sailStates.p + (-4.079911)*sailStates.q + (-0.012080)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end