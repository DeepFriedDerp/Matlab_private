function [aeroForces] = paramSpace_3_1_1_3_3_1_1(sailStates,airStates)

	CL = (4.239962)*sailStates.alpha + (-0.137759)*sailStates.beta + (-2.275209)*sailStates.p + (31.761499)*sailStates.q + (-0.498227)*sailStates.r + (0.010642)*sailStates.de;
	CD = -0.212270;
	CY = (0.105828)*sailStates.alpha + (-0.024364)*sailStates.beta + (-0.346576)*sailStates.p + (0.563442)*sailStates.q + (0.022656)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.289836)*sailStates.alpha + (0.116286)*sailStates.beta + (-1.033017)*sailStates.p + (8.127706)*sailStates.q + (-0.549953)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-14.984304)*sailStates.alpha + (0.626921)*sailStates.beta + (8.028082)*sailStates.p + (-129.238037)*sailStates.q + (1.710310)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.374483)*sailStates.alpha + (-0.011546)*sailStates.beta + (0.800378)*sailStates.p + (-4.107918)*sailStates.q + (-0.012193)*sailStates.r + (-0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end