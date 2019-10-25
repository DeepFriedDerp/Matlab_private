function [aeroForces] = paramSpace_4_3_4_1_2_1_2(sailStates,airStates)

	CL = (5.627060)*sailStates.alpha + (0.096017)*sailStates.beta + (-2.309187)*sailStates.p + (27.422903)*sailStates.q + (-1.253387)*sailStates.r + (0.008932)*sailStates.de;
	CD = -1.925170;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.788642)*sailStates.p + (-0.000001)*sailStates.q + (0.156871)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.614048)*sailStates.alpha + (0.421619)*sailStates.beta + (-1.093023)*sailStates.p + (7.617429)*sailStates.q + (-1.379115)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-16.428669)*sailStates.alpha + (-0.353574)*sailStates.beta + (9.629466)*sailStates.p + (-134.847153)*sailStates.q + (4.015597)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.621933)*sailStates.alpha + (-0.073869)*sailStates.beta + (2.003839)*sailStates.p + (-9.791323)*sailStates.q + (-0.081190)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end