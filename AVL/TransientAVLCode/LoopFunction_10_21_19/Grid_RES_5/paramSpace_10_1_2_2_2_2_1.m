function [aeroForces] = paramSpace_10_1_2_2_2_2_1(sailStates,airStates)

	CL = (4.158984)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.373137)*sailStates.p + (33.925598)*sailStates.q + (0.752025)*sailStates.r + (0.011108)*sailStates.de;
	CD = -0.085210;
	CY = (0.036699)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.251476)*sailStates.p + (0.466417)*sailStates.q + (-0.017601)*sailStates.r + (0.000100)*sailStates.de;

	Cl = (1.144987)*sailStates.alpha + (-0.144585)*sailStates.beta + (-1.041170)*sailStates.p + (8.348276)*sailStates.q + (0.622860)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-14.376459)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.965655)*sailStates.p + (-131.613632)*sailStates.q + (-2.544697)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (0.081721)*sailStates.alpha + (0.010110)*sailStates.beta + (-0.524663)*sailStates.p + (1.895324)*sailStates.q + (-0.001775)*sailStates.r + (-0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end