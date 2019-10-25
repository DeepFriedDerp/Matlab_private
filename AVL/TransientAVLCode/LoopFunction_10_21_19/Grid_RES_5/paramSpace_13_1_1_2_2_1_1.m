function [aeroForces] = paramSpace_13_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.046991)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.269534)*sailStates.p + (31.660116)*sailStates.q + (0.147797)*sailStates.r + (0.010431)*sailStates.de;
	CD = -0.082540;
	CY = (0.080498)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.161094)*sailStates.p + (0.546499)*sailStates.q + (0.028347)*sailStates.r + (0.000116)*sailStates.de;

	Cl = (1.140952)*sailStates.alpha + (0.058742)*sailStates.beta + (-0.999598)*sailStates.p + (7.787763)*sailStates.q + (-0.080577)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-14.994468)*sailStates.alpha + (0.000000)*sailStates.beta + (8.091482)*sailStates.p + (-130.238892)*sailStates.q + (-0.512767)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (-0.325093)*sailStates.alpha + (-0.010358)*sailStates.beta + (0.479099)*sailStates.p + (-2.915866)*sailStates.q + (-0.039417)*sailStates.r + (-0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end