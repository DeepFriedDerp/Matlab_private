function [aeroForces] = paramSpace_3_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.243425)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.069227)*sailStates.p + (35.256683)*sailStates.q + (-2.242918)*sailStates.r + (0.011358)*sailStates.de;
	CD = -1.010530;
	CY = (0.280853)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.888300)*sailStates.p + (0.624082)*sailStates.q + (-0.156609)*sailStates.r + (0.000132)*sailStates.de;

	Cl = (1.553858)*sailStates.alpha + (0.419253)*sailStates.beta + (-0.780077)*sailStates.p + (7.124928)*sailStates.q + (-1.855040)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-12.461124)*sailStates.alpha + (0.000000)*sailStates.beta + (5.655833)*sailStates.p + (-120.478767)*sailStates.q + (7.449350)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (-1.035313)*sailStates.alpha + (0.073926)*sailStates.beta + (1.899919)*sailStates.p + (-8.797478)*sailStates.q + (0.032119)*sailStates.r + (-0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end