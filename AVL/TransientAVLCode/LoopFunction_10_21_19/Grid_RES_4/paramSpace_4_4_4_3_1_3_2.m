function [aeroForces] = paramSpace_4_4_4_3_1_3_2(sailStates,airStates)

	CL = (4.224321)*sailStates.alpha + (-0.405936)*sailStates.beta + (-2.495697)*sailStates.p + (37.495823)*sailStates.q + (1.778140)*sailStates.r + (0.010799)*sailStates.de;
	CD = -0.240850;
	CY = (-0.065935)*sailStates.alpha + (-0.023075)*sailStates.beta + (0.622364)*sailStates.p + (-0.489621)*sailStates.q + (-0.123849)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.343893)*sailStates.alpha + (-0.402670)*sailStates.beta + (-1.113341)*sailStates.p + (9.881275)*sailStates.q + (1.413828)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-12.440362)*sailStates.alpha + (1.576692)*sailStates.beta + (7.494841)*sailStates.p + (-133.122269)*sailStates.q + (-5.939911)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.117014)*sailStates.alpha + (0.054905)*sailStates.beta + (-1.201646)*sailStates.p + (5.016207)*sailStates.q + (0.001626)*sailStates.r + (0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end