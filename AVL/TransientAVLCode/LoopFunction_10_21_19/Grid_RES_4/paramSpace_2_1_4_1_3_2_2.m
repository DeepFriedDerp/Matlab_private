function [aeroForces] = paramSpace_2_1_4_1_3_2_2(sailStates,airStates)

	CL = (4.203675)*sailStates.alpha + (-0.098160)*sailStates.beta + (-2.530446)*sailStates.p + (34.771721)*sailStates.q + (-0.760336)*sailStates.r + (0.010915)*sailStates.de;
	CD = -0.039370;
	CY = (0.213540)*sailStates.alpha + (-0.026056)*sailStates.beta + (-0.326566)*sailStates.p + (1.693496)*sailStates.q + (-0.021226)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (1.467880)*sailStates.alpha + (0.044310)*sailStates.beta + (-1.237270)*sailStates.p + (10.344851)*sailStates.q + (-0.555777)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-14.826404)*sailStates.alpha + (0.255742)*sailStates.beta + (8.500479)*sailStates.p + (-135.354233)*sailStates.q + (2.523577)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.229358)*sailStates.alpha + (0.007409)*sailStates.beta + (0.627184)*sailStates.p + (-3.976207)*sailStates.q + (0.009453)*sailStates.r + (-0.000549)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end