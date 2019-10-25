function [aeroForces] = paramSpace_1_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.448044)*sailStates.alpha + (-0.388823)*sailStates.beta + (-2.151986)*sailStates.p + (35.241394)*sailStates.q + (-1.833752)*sailStates.r + (0.011124)*sailStates.de;
	CD = -0.475870;
	CY = (0.066290)*sailStates.alpha + (-0.023922)*sailStates.beta + (-0.619464)*sailStates.p + (-0.301045)*sailStates.q + (-0.123251)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.225962)*sailStates.alpha + (0.202274)*sailStates.beta + (-0.908301)*sailStates.p + (8.310314)*sailStates.q + (-1.467897)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-12.146652)*sailStates.alpha + (1.374668)*sailStates.beta + (6.202716)*sailStates.p + (-122.964470)*sailStates.q + (6.065615)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.425824)*sailStates.alpha + (0.065129)*sailStates.beta + (1.294386)*sailStates.p + (-5.243330)*sailStates.q + (0.001232)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end