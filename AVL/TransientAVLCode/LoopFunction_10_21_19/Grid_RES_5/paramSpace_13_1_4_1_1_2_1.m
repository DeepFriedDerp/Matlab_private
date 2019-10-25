function [aeroForces] = paramSpace_13_1_4_1_1_2_1(sailStates,airStates)

	CL = (5.200104)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.068194)*sailStates.p + (35.342827)*sailStates.q + (2.258528)*sailStates.r + (0.011203)*sailStates.de;
	CD = -1.015580;
	CY = (-0.287144)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.917188)*sailStates.p + (-0.624083)*sailStates.q + (-0.161792)*sailStates.r + (-0.000132)*sailStates.de;

	Cl = (1.564706)*sailStates.alpha + (-0.433705)*sailStates.beta + (-0.779544)*sailStates.p + (7.128953)*sailStates.q + (1.901310)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-12.109446)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.640322)*sailStates.p + (-120.478767)*sailStates.q + (-7.537317)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (1.050699)*sailStates.alpha + (0.076474)*sailStates.beta + (-1.943289)*sailStates.p + (8.820308)*sailStates.q + (0.031418)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end