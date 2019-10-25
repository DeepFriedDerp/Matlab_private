function [aeroForces] = paramSpace_1_2_3_2_1_2_1(sailStates,airStates)

	CL = (3.888641)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.132606)*sailStates.p + (31.781065)*sailStates.q + (-0.535429)*sailStates.r + (0.010673)*sailStates.de;
	CD = 0.048630;
	CY = (-0.124555)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.015046)*sailStates.p + (-1.027328)*sailStates.q + (-0.002751)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.971952)*sailStates.alpha + (0.048511)*sailStates.beta + (-0.867040)*sailStates.p + (6.790666)*sailStates.q + (-0.299447)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-14.171995)*sailStates.alpha + (0.000000)*sailStates.beta + (7.285990)*sailStates.p + (-125.588745)*sailStates.q + (1.804574)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.194382)*sailStates.alpha + (0.008554)*sailStates.beta + (-0.041518)*sailStates.p + (1.198918)*sailStates.q + (-0.033246)*sailStates.r + (0.000285)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end