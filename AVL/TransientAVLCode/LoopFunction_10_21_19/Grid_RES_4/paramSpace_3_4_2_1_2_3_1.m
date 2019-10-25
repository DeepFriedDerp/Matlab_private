function [aeroForces] = paramSpace_3_4_2_1_2_3_1(sailStates,airStates)

	CL = (6.121000)*sailStates.alpha + (-0.560632)*sailStates.beta + (-1.720489)*sailStates.p + (30.186165)*sailStates.q + (2.433243)*sailStates.r + (0.011023)*sailStates.de;
	CD = -2.306200;
	CY = (-0.368270)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.081822)*sailStates.p + (0.221992)*sailStates.q + (-0.070914)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.155674)*sailStates.alpha + (-0.700286)*sailStates.beta + (-0.445675)*sailStates.p + (3.103131)*sailStates.q + (2.196473)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-12.353120)*sailStates.alpha + (2.162469)*sailStates.beta + (5.244265)*sailStates.p + (-111.854546)*sailStates.q + (-8.244070)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (2.091254)*sailStates.alpha + (0.032538)*sailStates.beta + (-2.424826)*sailStates.p + (10.916790)*sailStates.q + (0.016895)*sailStates.r + (0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end