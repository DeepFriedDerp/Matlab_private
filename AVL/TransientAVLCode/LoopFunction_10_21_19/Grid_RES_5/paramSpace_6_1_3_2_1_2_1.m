function [aeroForces] = paramSpace_6_1_3_2_1_2_1(sailStates,airStates)

	CL = (4.208846)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.343261)*sailStates.p + (32.555019)*sailStates.q + (0.322008)*sailStates.r + (0.010832)*sailStates.de;
	CD = -0.125660;
	CY = (-0.080023)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.255775)*sailStates.p + (-0.466417)*sailStates.q + (0.017869)*sailStates.r + (-0.000100)*sailStates.de;

	Cl = (1.212904)*sailStates.alpha + (-0.109041)*sailStates.beta + (-1.031719)*sailStates.p + (7.986415)*sailStates.q + (0.381899)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-15.085879)*sailStates.alpha + (0.000000)*sailStates.beta + (8.220095)*sailStates.p + (-131.613632)*sailStates.q + (-1.093964)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (0.301352)*sailStates.alpha + (-0.007625)*sailStates.beta + (-0.614581)*sailStates.p + (3.279540)*sailStates.q + (-0.011241)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end