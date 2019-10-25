function [aeroForces] = paramSpace_3_4_1_1_1_2_2(sailStates,airStates)

	CL = (4.203675)*sailStates.alpha + (-0.098160)*sailStates.beta + (-2.530446)*sailStates.p + (34.771721)*sailStates.q + (0.760336)*sailStates.r + (0.010915)*sailStates.de;
	CD = -0.039370;
	CY = (-0.213540)*sailStates.alpha + (-0.023516)*sailStates.beta + (0.326566)*sailStates.p + (-1.693496)*sailStates.q + (-0.021226)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.318733)*sailStates.alpha + (-0.142818)*sailStates.beta + (-1.139566)*sailStates.p + (9.136293)*sailStates.q + (0.549500)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.826404)*sailStates.alpha + (0.255742)*sailStates.beta + (8.500479)*sailStates.p + (-135.354233)*sailStates.q + (-2.523577)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.263995)*sailStates.alpha + (0.004856)*sailStates.beta + (-0.633588)*sailStates.p + (4.055420)*sailStates.q + (0.009864)*sailStates.r + (0.000549)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end