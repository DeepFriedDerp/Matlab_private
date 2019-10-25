function [aeroForces] = paramSpace_10_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.197701)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.103223)*sailStates.p + (40.809708)*sailStates.q + (1.949819)*sailStates.r + (0.011692)*sailStates.de;
	CD = -0.974060;
	CY = (0.032765)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.843320)*sailStates.p + (-1.113126)*sailStates.q + (-0.058853)*sailStates.r + (-0.000242)*sailStates.de;

	Cl = (1.971155)*sailStates.alpha + (-0.376679)*sailStates.beta + (-1.630016)*sailStates.p + (14.115554)*sailStates.q + (1.673228)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.406549)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.038926)*sailStates.p + (-150.805054)*sailStates.q + (-6.555575)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (-0.374683)*sailStates.alpha + (0.026340)*sailStates.beta + (-1.775266)*sailStates.p + (8.636127)*sailStates.q + (0.014699)*sailStates.r + (0.000509)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end