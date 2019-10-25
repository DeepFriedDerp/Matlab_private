function [aeroForces] = paramSpace_4_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.255089)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.340527)*sailStates.p + (34.830124)*sailStates.q + (-1.297622)*sailStates.r + (0.011019)*sailStates.de;
	CD = -0.162640;
	CY = (0.080202)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.465769)*sailStates.p + (0.291853)*sailStates.q + (-0.065470)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.266763)*sailStates.alpha + (0.221179)*sailStates.beta + (-1.020552)*sailStates.p + (8.600731)*sailStates.q + (-1.038144)*sailStates.r + (0.000043)*sailStates.de;
	Cm = (-13.698420)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.454167)*sailStates.p + (-130.037888)*sailStates.q + (4.366513)*sailStates.r + (-0.068518)*sailStates.de;
	Cn = (-0.240391)*sailStates.alpha + (0.031085)*sailStates.beta + (0.919689)*sailStates.p + (-3.952183)*sailStates.q + (0.003489)*sailStates.r + (-0.000150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end