function [aeroForces] = paramSpace_1_3_2_1_3_2_1(sailStates,airStates)

	CL = (3.798982)*sailStates.alpha + (0.178113)*sailStates.beta + (-1.581923)*sailStates.p + (28.007132)*sailStates.q + (-0.998587)*sailStates.r + (0.010217)*sailStates.de;
	CD = -0.037910;
	CY = (0.279387)*sailStates.alpha + (-0.022105)*sailStates.beta + (-0.369608)*sailStates.p + (1.081941)*sailStates.q + (-0.065172)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.670159)*sailStates.alpha + (0.188893)*sailStates.beta + (-0.392031)*sailStates.p + (2.638442)*sailStates.q + (-0.695102)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-12.746185)*sailStates.alpha + (-0.636180)*sailStates.beta + (4.951460)*sailStates.p + (-108.520645)*sailStates.q + (3.325477)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.768307)*sailStates.alpha + (0.020018)*sailStates.beta + (0.767316)*sailStates.p + (-4.334351)*sailStates.q + (0.024922)*sailStates.r + (-0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end