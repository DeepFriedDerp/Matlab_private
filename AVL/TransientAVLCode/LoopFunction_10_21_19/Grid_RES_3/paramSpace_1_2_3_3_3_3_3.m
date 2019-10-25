function [aeroForces] = paramSpace_1_2_3_3_3_3_3(sailStates,airStates)

	CL = (4.012226)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.698973)*sailStates.p + (35.313164)*sailStates.q + (-0.425860)*sailStates.r + (0.010566)*sailStates.de;
	CD = -0.063020;
	CY = (0.083999)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.019408)*sailStates.p + (0.665001)*sailStates.q + (0.003485)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.302600)*sailStates.alpha + (-0.036236)*sailStates.beta + (-1.360315)*sailStates.p + (11.340451)*sailStates.q + (-0.137317)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-14.753993)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.386942)*sailStates.p + (-141.960541)*sailStates.q + (1.424498)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.113956)*sailStates.alpha + (-0.006389)*sailStates.beta + (-0.260283)*sailStates.p + (1.349568)*sailStates.q + (-0.028168)*sailStates.r + (-0.000185)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end