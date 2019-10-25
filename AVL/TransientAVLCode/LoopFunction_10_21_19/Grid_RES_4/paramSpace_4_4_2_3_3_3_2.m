function [aeroForces] = paramSpace_4_4_2_3_3_3_2(sailStates,airStates)

	CL = (4.017586)*sailStates.alpha + (-0.329912)*sailStates.beta + (-2.526004)*sailStates.p + (37.238068)*sailStates.q + (1.510599)*sailStates.r + (0.010978)*sailStates.de;
	CD = -0.130550;
	CY = (0.064268)*sailStates.alpha + (-0.026294)*sailStates.beta + (0.438062)*sailStates.p + (0.489618)*sailStates.q + (-0.087154)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.111311)*sailStates.alpha + (-0.332467)*sailStates.beta + (-1.131995)*sailStates.p + (9.825834)*sailStates.q + (1.161569)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-12.601551)*sailStates.alpha + (1.198604)*sailStates.beta + (7.849411)*sailStates.p + (-134.519470)*sailStates.q + (-5.033588)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.052998)*sailStates.alpha + (0.048878)*sailStates.beta + (-0.830067)*sailStates.p + (2.765934)*sailStates.q + (-0.021150)*sailStates.r + (-0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end