function [aeroForces] = paramSpace_1_2_1_1_1_2_2(sailStates,airStates)

	CL = (3.841831)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.545931)*sailStates.p + (35.055382)*sailStates.q + (-0.462176)*sailStates.r + (0.010653)*sailStates.de;
	CD = 0.064210;
	CY = (-0.203477)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.048845)*sailStates.p + (-1.671348)*sailStates.q + (0.008772)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.182396)*sailStates.alpha + (0.042233)*sailStates.beta + (-1.201697)*sailStates.p + (9.813224)*sailStates.q + (-0.283527)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-13.953045)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.814012)*sailStates.p + (-137.643188)*sailStates.q + (1.631897)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.381257)*sailStates.alpha + (0.007447)*sailStates.beta + (-0.255924)*sailStates.p + (3.166746)*sailStates.q + (-0.058210)*sailStates.r + (0.000509)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end