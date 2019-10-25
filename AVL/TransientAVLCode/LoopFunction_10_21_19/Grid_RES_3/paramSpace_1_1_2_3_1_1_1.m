function [aeroForces] = paramSpace_1_1_2_3_1_1_1(sailStates,airStates)

	CL = (4.041956)*sailStates.alpha + (-0.271980)*sailStates.beta + (-2.290461)*sailStates.p + (34.875019)*sailStates.q + (-1.317453)*sailStates.r + (0.010896)*sailStates.de;
	CD = -0.134070;
	CY = (-0.042523)*sailStates.alpha + (-0.023155)*sailStates.beta + (-0.395165)*sailStates.p + (-0.665001)*sailStates.q + (-0.069678)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.129675)*sailStates.alpha + (0.147649)*sailStates.beta + (-1.023874)*sailStates.p + (8.896656)*sailStates.q + (-1.043192)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-12.815793)*sailStates.alpha + (1.020465)*sailStates.beta + (7.201689)*sailStates.p + (-128.181442)*sailStates.q + (4.416113)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (-0.066306)*sailStates.alpha + (0.037745)*sailStates.beta + (0.769316)*sailStates.p + (-2.455131)*sailStates.q + (-0.016458)*sailStates.r + (0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end