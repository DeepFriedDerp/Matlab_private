function [aeroForces] = paramSpace_4_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.229665)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.081333)*sailStates.p + (42.732113)*sailStates.q + (-2.403899)*sailStates.r + (0.011691)*sailStates.de;
	CD = -1.038210;
	CY = (-0.039414)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.982328)*sailStates.p + (1.241889)*sailStates.q + (-0.138189)*sailStates.r + (0.000268)*sailStates.de;

	Cl = (2.030015)*sailStates.alpha + (0.441360)*sailStates.beta + (-1.609002)*sailStates.p + (14.625972)*sailStates.q + (-2.044751)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-13.157832)*sailStates.alpha + (0.000000)*sailStates.beta + (9.300912)*sailStates.p + (-149.211060)*sailStates.q + (8.081283)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (0.546255)*sailStates.alpha + (0.062029)*sailStates.beta + (1.964759)*sailStates.p + (-8.900038)*sailStates.q + (0.020399)*sailStates.r + (-0.000516)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end