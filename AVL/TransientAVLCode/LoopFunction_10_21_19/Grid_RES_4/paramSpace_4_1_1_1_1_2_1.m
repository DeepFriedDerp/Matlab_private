function [aeroForces] = paramSpace_4_1_1_1_1_2_1(sailStates,airStates)

	CL = (3.805370)*sailStates.alpha + (0.185835)*sailStates.beta + (-1.560622)*sailStates.p + (27.951973)*sailStates.q + (1.051521)*sailStates.r + (0.010214)*sailStates.de;
	CD = -0.044800;
	CY = (-0.266301)*sailStates.alpha + (-0.027664)*sailStates.beta + (0.358141)*sailStates.p + (-1.002334)*sailStates.q + (-0.071131)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.820698)*sailStates.alpha + (-0.076946)*sailStates.beta + (-0.471720)*sailStates.p + (3.771675)*sailStates.q + (0.716771)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-12.720196)*sailStates.alpha + (-0.578494)*sailStates.beta + (4.798885)*sailStates.p + (-107.565659)*sailStates.q + (-3.466116)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (0.693869)*sailStates.alpha + (0.031976)*sailStates.beta + (-0.742533)*sailStates.p + (4.154386)*sailStates.q + (0.023348)*sailStates.r + (0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end