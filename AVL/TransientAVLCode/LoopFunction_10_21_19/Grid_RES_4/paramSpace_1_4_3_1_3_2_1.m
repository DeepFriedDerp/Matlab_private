function [aeroForces] = paramSpace_1_4_3_1_3_2_1(sailStates,airStates)

	CL = (3.774840)*sailStates.alpha + (0.206288)*sailStates.beta + (-1.560162)*sailStates.p + (27.999407)*sailStates.q + (-1.058586)*sailStates.r + (0.010130)*sailStates.de;
	CD = -0.040380;
	CY = (0.271666)*sailStates.alpha + (-0.021700)*sailStates.beta + (-0.372229)*sailStates.p + (1.002334)*sailStates.q + (-0.074005)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (0.654247)*sailStates.alpha + (0.202131)*sailStates.beta + (-0.377052)*sailStates.p + (2.586044)*sailStates.q + (-0.720628)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-12.529503)*sailStates.alpha + (-0.707566)*sailStates.beta + (4.791083)*sailStates.p + (-107.565659)*sailStates.q + (3.505334)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-0.781700)*sailStates.alpha + (0.023132)*sailStates.beta + (0.782483)*sailStates.p + (-4.401991)*sailStates.q + (0.027135)*sailStates.r + (-0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end