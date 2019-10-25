function [aeroForces] = paramSpace_1_2_1_2_3_1_2(sailStates,airStates)

	CL = (4.788626)*sailStates.alpha + (-0.167523)*sailStates.beta + (-2.533972)*sailStates.p + (39.081844)*sailStates.q + (-2.215475)*sailStates.r + (0.011213)*sailStates.de;
	CD = -0.632640;
	CY = (0.106017)*sailStates.alpha + (-0.025859)*sailStates.beta + (-0.832212)*sailStates.p + (0.756270)*sailStates.q + (-0.165618)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.683490)*sailStates.alpha + (0.337344)*sailStates.beta + (-1.188867)*sailStates.p + (11.099129)*sailStates.q + (-1.823070)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-12.343222)*sailStates.alpha + (0.646879)*sailStates.beta + (7.229312)*sailStates.p + (-133.768066)*sailStates.q + (7.374064)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.134403)*sailStates.alpha + (0.078398)*sailStates.beta + (1.657967)*sailStates.p + (-7.160358)*sailStates.q + (0.014004)*sailStates.r + (-0.000332)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end