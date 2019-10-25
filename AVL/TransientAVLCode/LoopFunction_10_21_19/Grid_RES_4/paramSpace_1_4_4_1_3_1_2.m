function [aeroForces] = paramSpace_1_4_4_1_3_1_2(sailStates,airStates)

	CL = (7.774517)*sailStates.alpha + (0.754013)*sailStates.beta + (-2.583265)*sailStates.p + (43.147606)*sailStates.q + (-3.644140)*sailStates.r + (0.012152)*sailStates.de;
	CD = -3.026140;
	CY = (0.257428)*sailStates.alpha + (-0.020007)*sailStates.beta + (-1.495058)*sailStates.p + (1.664518)*sailStates.q + (-0.297207)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (2.945671)*sailStates.alpha + (0.910663)*sailStates.beta + (-1.130759)*sailStates.p + (11.415124)*sailStates.q + (-3.066216)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-12.354197)*sailStates.alpha + (-2.731241)*sailStates.beta + (6.081005)*sailStates.p + (-131.445847)*sailStates.q + (11.996399)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.534712)*sailStates.alpha + (0.120639)*sailStates.beta + (3.189361)*sailStates.p + (-15.092877)*sailStates.q + (0.068776)*sailStates.r + (-0.000737)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end