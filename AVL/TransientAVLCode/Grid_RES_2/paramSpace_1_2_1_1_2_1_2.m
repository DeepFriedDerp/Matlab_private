function [aeroForces] = paramSpace_1_2_1_1_2_1_2(sailStates,airStates)

	CL = (7.936321)*sailStates.alpha + (-0.540969)*sailStates.beta + (-2.570326)*sailStates.p + (29.254644)*sailStates.q + (0.403653)*sailStates.r + (0.008613)*sailStates.de;
	CD = -5.231450;
	CY = (1.941599)*sailStates.alpha + (0.002325)*sailStates.beta + (-0.219249)*sailStates.p + (15.859531)*sailStates.q + (-0.026618)*sailStates.r + (0.003378)*sailStates.de;

	Cl = (-2.139843)*sailStates.alpha + (-0.547351)*sailStates.beta + (-1.375281)*sailStates.p + (11.294505)*sailStates.q + (1.055889)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-12.341509)*sailStates.alpha + (2.550060)*sailStates.beta + (9.329322)*sailStates.p + (-138.162582)*sailStates.q + (-1.591440)*sailStates.r + (-0.068410)*sailStates.de;
	Cn = (-2.043976)*sailStates.alpha + (-0.087345)*sailStates.beta + (-0.142121)*sailStates.p + (-10.684400)*sailStates.q + (0.139990)*sailStates.r + (-0.004476)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end