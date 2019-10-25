function [aeroForces] = paramSpace_3_1_4_1_2_1_2(sailStates,airStates)

	CL = (5.274595)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.062033)*sailStates.p + (43.567051)*sailStates.q + (-2.585579)*sailStates.r + (0.011935)*sailStates.de;
	CD = -1.026600;
	CY = (-0.027889)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.981962)*sailStates.p + (1.304045)*sailStates.q + (-0.173007)*sailStates.r + (0.000280)*sailStates.de;

	Cl = (2.033330)*sailStates.alpha + (0.438951)*sailStates.beta + (-1.593744)*sailStates.p + (14.886795)*sailStates.q + (-2.119272)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-13.058298)*sailStates.alpha + (0.000000)*sailStates.beta + (8.895504)*sailStates.p + (-148.140839)*sailStates.q + (8.565993)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.580159)*sailStates.alpha + (0.077399)*sailStates.beta + (1.959763)*sailStates.p + (-8.965257)*sailStates.q + (0.020976)*sailStates.r + (-0.000576)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end