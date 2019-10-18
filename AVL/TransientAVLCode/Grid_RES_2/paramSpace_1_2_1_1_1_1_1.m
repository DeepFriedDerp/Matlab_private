function [aeroForces] = paramSpace_1_2_1_1_1_1_1(sailStates,airStates)

	CL = (6.909477)*sailStates.alpha + (-0.438619)*sailStates.beta + (-2.559345)*sailStates.p + (30.114233)*sailStates.q + (0.209703)*sailStates.r + (0.008956)*sailStates.de;
	CD = -3.729600;
	CY = (1.659690)*sailStates.alpha + (-0.001622)*sailStates.beta + (-0.224584)*sailStates.p + (13.550578)*sailStates.q + (-0.027648)*sailStates.r + (0.002885)*sailStates.de;

	Cl = (-1.074194)*sailStates.alpha + (-0.440642)*sailStates.beta + (-1.336626)*sailStates.p + (10.969961)*sailStates.q + (0.805093)*sailStates.r + (0.000316)*sailStates.de;
	Cm = (-13.618431)*sailStates.alpha + (2.107414)*sailStates.beta + (9.169861)*sailStates.p + (-137.597290)*sailStates.q + (-0.910085)*sailStates.r + (-0.068352)*sailStates.de;
	Cn = (-1.655452)*sailStates.alpha + (-0.072148)*sailStates.beta + (-0.051946)*sailStates.p + (-9.411440)*sailStates.q + (0.118707)*sailStates.r + (-0.003833)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end