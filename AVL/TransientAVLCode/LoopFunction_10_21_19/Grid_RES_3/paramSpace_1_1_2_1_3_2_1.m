function [aeroForces] = paramSpace_1_1_2_1_3_2_1(sailStates,airStates)

	CL = (3.798983)*sailStates.alpha + (-0.178113)*sailStates.beta + (-1.581923)*sailStates.p + (28.007132)*sailStates.q + (-0.998587)*sailStates.r + (0.010217)*sailStates.de;
	CD = -0.037910;
	CY = (0.279387)*sailStates.alpha + (-0.027557)*sailStates.beta + (-0.369608)*sailStates.p + (1.081941)*sailStates.q + (-0.065172)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.827737)*sailStates.alpha + (0.089810)*sailStates.beta + (-0.476666)*sailStates.p + (3.699309)*sailStates.q + (-0.710026)*sailStates.r + (-0.000764)*sailStates.de;
	Cm = (-12.746186)*sailStates.alpha + (0.636180)*sailStates.beta + (4.951460)*sailStates.p + (-108.520653)*sailStates.q + (3.325477)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.706610)*sailStates.alpha + (0.029125)*sailStates.beta + (0.752393)*sailStates.p + (-4.147291)*sailStates.q + (0.022291)*sailStates.r + (-0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end