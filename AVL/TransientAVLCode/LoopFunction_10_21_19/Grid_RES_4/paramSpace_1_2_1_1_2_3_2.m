function [aeroForces] = paramSpace_1_2_1_1_2_3_2(sailStates,airStates)

	CL = (5.627060)*sailStates.alpha + (0.096017)*sailStates.beta + (-2.309186)*sailStates.p + (27.422903)*sailStates.q + (1.253387)*sailStates.r + (0.008932)*sailStates.de;
	CD = -1.925170;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.788642)*sailStates.p + (0.000001)*sailStates.q + (0.156871)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.669314)*sailStates.alpha + (-0.366736)*sailStates.beta + (-1.124555)*sailStates.p + (8.014397)*sailStates.q + (1.372799)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-16.428669)*sailStates.alpha + (-0.353574)*sailStates.beta + (9.629466)*sailStates.p + (-134.847153)*sailStates.q + (-4.015597)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.597165)*sailStates.alpha + (-0.082945)*sailStates.beta + (-2.010112)*sailStates.p + (9.870285)*sailStates.q + (-0.082446)*sailStates.r + (0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end