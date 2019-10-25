function [aeroForces] = paramSpace_2_1_3_1_2_1_2(sailStates,airStates)

	CL = (6.295008)*sailStates.alpha + (-0.434653)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-2.206621)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.235980;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.032308)*sailStates.p + (0.000002)*sailStates.q + (-0.000000)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.921503)*sailStates.alpha + (0.384835)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-2.045922)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.646000)*sailStates.alpha + (1.649184)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (7.480659)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.342941)*sailStates.alpha + (-0.000235)*sailStates.beta + (2.329486)*sailStates.p + (-10.719303)*sailStates.q + (-0.000132)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end