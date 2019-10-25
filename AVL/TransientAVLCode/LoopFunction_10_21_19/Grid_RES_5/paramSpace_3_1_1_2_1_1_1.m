function [aeroForces] = paramSpace_3_1_1_2_1_1_1(sailStates,airStates)

	CL = (3.998677)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.341179)*sailStates.p + (35.202000)*sailStates.q + (-1.257510)*sailStates.r + (0.010873)*sailStates.de;
	CD = -0.064360;
	CY = (-0.036092)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.383328)*sailStates.p + (-0.546500)*sailStates.q + (-0.067533)*sailStates.r + (-0.000116)*sailStates.de;

	Cl = (1.105410)*sailStates.alpha + (0.213459)*sailStates.beta + (-1.021930)*sailStates.p + (8.694558)*sailStates.q + (-0.997968)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-12.921130)*sailStates.alpha + (0.000000)*sailStates.beta + (7.432991)*sailStates.p + (-130.238892)*sailStates.q + (4.247256)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (-0.057147)*sailStates.alpha + (0.037639)*sailStates.beta + (0.722189)*sailStates.p + (-2.226825)*sailStates.q + (-0.017235)*sailStates.r + (0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end