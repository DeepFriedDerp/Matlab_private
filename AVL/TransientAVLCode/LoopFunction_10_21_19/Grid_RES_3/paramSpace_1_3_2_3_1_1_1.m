function [aeroForces] = paramSpace_1_3_2_3_1_1_1(sailStates,airStates)

	CL = (4.041956)*sailStates.alpha + (0.271980)*sailStates.beta + (-2.290461)*sailStates.p + (34.875019)*sailStates.q + (-1.317453)*sailStates.r + (0.010896)*sailStates.de;
	CD = -0.134070;
	CY = (-0.042523)*sailStates.alpha + (-0.026506)*sailStates.beta + (-0.395165)*sailStates.p + (-0.665001)*sailStates.q + (-0.069678)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.000858)*sailStates.alpha + (0.294866)*sailStates.beta + (-0.939239)*sailStates.p + (7.835788)*sailStates.q + (-1.028269)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-12.815793)*sailStates.alpha + (-1.020465)*sailStates.beta + (7.201689)*sailStates.p + (-128.181442)*sailStates.q + (4.416113)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (-0.142673)*sailStates.alpha + (0.040282)*sailStates.beta + (0.784239)*sailStates.p + (-2.642190)*sailStates.q + (-0.013827)*sailStates.r + (0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end