function [aeroForces] = paramSpace_10_1_4_2_1_1_2(sailStates,airStates)

	CL = (4.066853)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.761746)*sailStates.p + (36.107788)*sailStates.q + (-0.030685)*sailStates.r + (0.010971)*sailStates.de;
	CD = -0.033730;
	CY = (-0.064478)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.074997)*sailStates.p + (-0.466417)*sailStates.q + (0.005195)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.334113)*sailStates.alpha + (0.056343)*sailStates.beta + (-1.375489)*sailStates.p + (11.248571)*sailStates.q + (-0.110280)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.697353)*sailStates.alpha + (0.000000)*sailStates.beta + (9.540059)*sailStates.p + (-142.955811)*sailStates.q + (0.077197)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (-0.037249)*sailStates.alpha + (-0.003940)*sailStates.beta + (0.284961)*sailStates.p + (-1.388135)*sailStates.q + (-0.005670)*sailStates.r + (0.000089)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end