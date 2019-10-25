function [aeroForces] = paramSpace_13_1_1_2_1_1_2(sailStates,airStates)

	CL = (3.994564)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.664404)*sailStates.p + (35.282288)*sailStates.q + (0.502705)*sailStates.r + (0.010631)*sailStates.de;
	CD = -0.022600;
	CY = (-0.066428)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.013171)*sailStates.p + (-0.546499)*sailStates.q + (-0.002264)*sailStates.r + (-0.000117)*sailStates.de;

	Cl = (1.291158)*sailStates.alpha + (0.015219)*sailStates.beta + (-1.327498)*sailStates.p + (11.081638)*sailStates.q + (0.210366)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-14.712431)*sailStates.alpha + (0.000000)*sailStates.beta + (9.200734)*sailStates.p + (-140.819473)*sailStates.q + (-1.676586)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (-0.125509)*sailStates.alpha + (-0.002684)*sailStates.beta + (0.174686)*sailStates.p + (-1.008501)*sailStates.q + (-0.027028)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end