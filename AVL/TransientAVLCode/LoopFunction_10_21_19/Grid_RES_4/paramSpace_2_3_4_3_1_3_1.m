function [aeroForces] = paramSpace_2_3_4_3_1_3_1(sailStates,airStates)

	CL = (4.301395)*sailStates.alpha + (-0.045942)*sailStates.beta + (-2.294746)*sailStates.p + (32.027447)*sailStates.q + (0.495788)*sailStates.r + (0.010807)*sailStates.de;
	CD = -0.212090;
	CY = (-0.106321)*sailStates.alpha + (-0.025117)*sailStates.beta + (0.346172)*sailStates.p + (-0.563442)*sailStates.q + (0.022630)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.199297)*sailStates.alpha + (-0.161325)*sailStates.beta + (-0.977034)*sailStates.p + (7.395958)*sailStates.q + (0.552673)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-15.211227)*sailStates.alpha + (0.209386)*sailStates.beta + (8.094763)*sailStates.p + (-130.282166)*sailStates.q + (-1.702284)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.395628)*sailStates.alpha + (-0.009265)*sailStates.beta + (-0.795583)*sailStates.p + (4.053439)*sailStates.q + (-0.011943)*sailStates.r + (0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end