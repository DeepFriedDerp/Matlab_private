function [aeroForces] = paramSpace_2_4_4_3_1_3_1(sailStates,airStates)

	CL = (4.239962)*sailStates.alpha + (-0.137759)*sailStates.beta + (-2.275209)*sailStates.p + (31.761499)*sailStates.q + (0.498226)*sailStates.r + (0.010642)*sailStates.de;
	CD = -0.212270;
	CY = (-0.105828)*sailStates.alpha + (-0.025209)*sailStates.beta + (0.346576)*sailStates.p + (-0.563442)*sailStates.q + (0.022656)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.127463)*sailStates.alpha + (-0.183071)*sailStates.beta + (-0.935312)*sailStates.p + (6.919144)*sailStates.q + (0.556229)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.984304)*sailStates.alpha + (0.626922)*sailStates.beta + (8.028082)*sailStates.p + (-129.238022)*sailStates.q + (-1.710310)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.403301)*sailStates.alpha + (-0.008075)*sailStates.beta + (-0.793974)*sailStates.p + (4.028705)*sailStates.q + (-0.011781)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end