function [aeroForces] = paramSpace_1_2_1_1_1_1_2(sailStates,airStates)

	CL = (5.534151)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.697808)*sailStates.p + (42.115688)*sailStates.q + (-2.707499)*sailStates.r + (0.012060)*sailStates.de;
	CD = -1.860040;
	CY = (-0.236896)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.987409)*sailStates.p + (-1.671343)*sailStates.q + (-0.173948)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.110136)*sailStates.alpha + (0.560360)*sailStates.beta + (-1.249760)*sailStates.p + (11.677289)*sailStates.q + (-2.369808)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-9.883513)*sailStates.alpha + (0.000000)*sailStates.beta + (7.503311)*sailStates.p + (-137.643188)*sailStates.q + (9.065250)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.107992)*sailStates.alpha + (0.098807)*sailStates.beta + (2.094472)*sailStates.p + (-7.404889)*sailStates.q + (-0.010233)*sailStates.r + (0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end