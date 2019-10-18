function [aeroForces] = paramSpace_1_2_2_2_2_2_1(sailStates,airStates)

	CL = (8.085191)*sailStates.alpha + (-0.597129)*sailStates.beta + (-2.575638)*sailStates.p + (29.100912)*sailStates.q + (0.481358)*sailStates.r + (0.008705)*sailStates.de;
	CD = -5.481290;
	CY = (1.948189)*sailStates.alpha + (-0.004315)*sailStates.beta + (-0.162050)*sailStates.p + (15.873655)*sailStates.q + (-0.016837)*sailStates.r + (0.003381)*sailStates.de;

	Cl = (-2.419222)*sailStates.alpha + (-0.582866)*sailStates.beta + (-1.381105)*sailStates.p + (11.311707)*sailStates.q + (1.160644)*sailStates.r + (0.000352)*sailStates.de;
	Cm = (-12.130910)*sailStates.alpha + (2.876325)*sailStates.beta + (9.394997)*sailStates.p + (-138.370819)*sailStates.q + (-1.895117)*sailStates.r + (-0.068431)*sailStates.de;
	Cn = (-2.084430)*sailStates.alpha + (-0.081923)*sailStates.beta + (-0.249878)*sailStates.p + (-10.375945)*sailStates.q + (0.134543)*sailStates.r + (-0.004495)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end