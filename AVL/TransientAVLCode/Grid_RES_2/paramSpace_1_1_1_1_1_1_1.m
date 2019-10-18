function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.361794)*sailStates.alpha + (-0.580896)*sailStates.beta + (-2.398574)*sailStates.p + (37.551743)*sailStates.q + (-2.300509)*sailStates.r + (0.011527)*sailStates.de;
	CD = -1.628430;
	CY = (-0.119792)*sailStates.alpha + (-0.021081)*sailStates.beta + (-0.879521)*sailStates.p + (-1.584078)*sailStates.q + (-0.115679)*sailStates.r + (-0.000336)*sailStates.de;

	Cl = (1.124454)*sailStates.alpha + (0.350138)*sailStates.beta + (-1.075951)*sailStates.p + (9.674332)*sailStates.q + (-2.055649)*sailStates.r + (0.000199)*sailStates.de;
	Cm = (-11.091762)*sailStates.alpha + (2.302671)*sailStates.beta + (7.051606)*sailStates.p + (-129.688507)*sailStates.q + (7.766470)*sailStates.r + (-0.067569)*sailStates.de;
	Cn = (-0.309618)*sailStates.alpha + (0.066059)*sailStates.beta + (1.907783)*sailStates.p + (-6.970792)*sailStates.q + (-0.001162)*sailStates.r + (0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end