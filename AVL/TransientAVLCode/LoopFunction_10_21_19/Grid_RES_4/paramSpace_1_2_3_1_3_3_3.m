function [aeroForces] = paramSpace_1_2_3_1_3_3_3(sailStates,airStates)

	CL = (4.851893)*sailStates.alpha + (0.073760)*sailStates.beta + (-3.113711)*sailStates.p + (34.864136)*sailStates.q + (0.501392)*sailStates.r + (0.009527)*sailStates.de;
	CD = -1.482600;
	CY = (0.432838)*sailStates.alpha + (-0.027370)*sailStates.beta + (0.447928)*sailStates.p + (2.326706)*sailStates.q + (0.089182)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.317181)*sailStates.alpha + (-0.308374)*sailStates.beta + (-1.794277)*sailStates.p + (14.833723)*sailStates.q + (0.789671)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-14.471408)*sailStates.alpha + (-0.324400)*sailStates.beta + (11.831829)*sailStates.p + (-156.352325)*sailStates.q + (-1.601126)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.587681)*sailStates.alpha + (-0.065349)*sailStates.beta + (-1.415424)*sailStates.p + (5.931827)*sailStates.q + (-0.053672)*sailStates.r + (-0.000536)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end