function [aeroForces] = paramSpace_3_4_4_1_2_3_2(sailStates,airStates)

	CL = (6.447517)*sailStates.alpha + (-0.619648)*sailStates.beta + (-2.604735)*sailStates.p + (37.386749)*sailStates.q + (2.566149)*sailStates.r + (0.011360)*sailStates.de;
	CD = -2.367490;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (1.147310)*sailStates.p + (-0.000001)*sailStates.q + (-0.075199)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.827881)*sailStates.alpha + (-0.735314)*sailStates.beta + (-1.168162)*sailStates.p + (9.811053)*sailStates.q + (2.338369)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-13.354596)*sailStates.alpha + (2.487810)*sailStates.beta + (8.191385)*sailStates.p + (-136.150452)*sailStates.q + (-8.728952)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.394121)*sailStates.alpha + (0.033953)*sailStates.beta + (-2.494815)*sailStates.p + (10.999046)*sailStates.q + (0.014904)*sailStates.r + (0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end