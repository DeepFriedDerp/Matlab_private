function [aeroForces] = paramSpace_2_1_3_1_1_2_2(sailStates,airStates)

	CL = (4.169833)*sailStates.alpha + (0.080415)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (0.456057)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.027390;
	CY = (-0.210699)*sailStates.alpha + (-0.025257)*sailStates.beta + (0.294901)*sailStates.p + (-1.697131)*sailStates.q + (-0.000159)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.443624)*sailStates.alpha + (-0.051446)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (0.394724)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.930741)*sailStates.alpha + (-0.350269)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-1.556814)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.271598)*sailStates.alpha + (0.000597)*sailStates.beta + (-0.592123)*sailStates.p + (3.819956)*sailStates.q + (0.000016)*sailStates.r + (0.000517)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end