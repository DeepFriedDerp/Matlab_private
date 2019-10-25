function [aeroForces] = paramSpace_2_3_4_1_1_1_1(sailStates,airStates)

	CL = (5.301349)*sailStates.alpha + (0.159796)*sailStates.beta + (-1.757240)*sailStates.p + (30.342381)*sailStates.q + (-1.985871)*sailStates.r + (0.011222)*sailStates.de;
	CD = -1.756240;
	CY = (0.041855)*sailStates.alpha + (-0.025456)*sailStates.beta + (-0.793788)*sailStates.p + (-1.915494)*sailStates.q + (-0.052230)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.521489)*sailStates.alpha + (0.516406)*sailStates.beta + (-0.498096)*sailStates.p + (3.549597)*sailStates.q + (-1.815687)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-11.684643)*sailStates.alpha + (-0.608079)*sailStates.beta + (5.508105)*sailStates.p + (-113.694908)*sailStates.q + (6.733494)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-1.405006)*sailStates.alpha + (0.030611)*sailStates.beta + (1.839352)*sailStates.p + (-7.077760)*sailStates.q + (0.003816)*sailStates.r + (0.000411)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end