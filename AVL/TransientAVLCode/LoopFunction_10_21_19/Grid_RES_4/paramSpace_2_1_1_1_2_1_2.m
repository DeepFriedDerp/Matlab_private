function [aeroForces] = paramSpace_2_1_1_1_2_1_2(sailStates,airStates)

	CL = (6.447517)*sailStates.alpha + (-0.619648)*sailStates.beta + (-2.604735)*sailStates.p + (37.386753)*sailStates.q + (-2.566149)*sailStates.r + (0.011360)*sailStates.de;
	CD = -2.367490;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.147310)*sailStates.p + (0.000001)*sailStates.q + (-0.075199)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.967306)*sailStates.alpha + (0.400509)*sailStates.beta + (-1.265850)*sailStates.p + (11.019611)*sailStates.q + (-2.344898)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-13.354596)*sailStates.alpha + (2.487809)*sailStates.beta + (8.191385)*sailStates.p + (-136.150452)*sailStates.q + (8.728952)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.234585)*sailStates.alpha + (0.040492)*sailStates.beta + (2.488412)*sailStates.p + (-10.919833)*sailStates.q + (0.014476)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end