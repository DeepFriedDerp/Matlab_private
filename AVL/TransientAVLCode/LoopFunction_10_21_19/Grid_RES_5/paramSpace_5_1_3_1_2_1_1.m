function [aeroForces] = paramSpace_5_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.234413)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.083211)*sailStates.p + (33.442360)*sailStates.q + (-1.960064)*sailStates.r + (0.011258)*sailStates.de;
	CD = -0.992530;
	CY = (0.282323)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.840607)*sailStates.p + (0.768919)*sailStates.q + (-0.088324)*sailStates.r + (0.000164)*sailStates.de;

	Cl = (1.526220)*sailStates.alpha + (0.389328)*sailStates.beta + (-0.793279)*sailStates.p + (6.621449)*sailStates.q + (-1.673548)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-13.724831)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.337692)*sailStates.p + (-122.164581)*sailStates.q + (6.592093)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-1.041403)*sailStates.alpha + (0.040920)*sailStates.beta + (1.810572)*sailStates.p + (-8.658763)*sailStates.q + (0.023111)*sailStates.r + (-0.000356)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end