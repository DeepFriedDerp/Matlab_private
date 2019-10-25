function [aeroForces] = paramSpace_1_3_2_1_3_3_1(sailStates,airStates)

	CL = (4.738018)*sailStates.alpha + (-0.285853)*sailStates.beta + (-1.429999)*sailStates.p + (20.946833)*sailStates.q + (1.246462)*sailStates.r + (0.008842)*sailStates.de;
	CD = -1.621820;
	CY = (-0.133094)*sailStates.alpha + (-0.022105)*sailStates.beta + (0.666646)*sailStates.p + (1.081943)*sailStates.q + (0.117548)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.310287)*sailStates.alpha + (-0.455907)*sailStates.beta + (-0.343971)*sailStates.p + (0.774378)*sailStates.q + (1.391193)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-14.557727)*sailStates.alpha + (1.148063)*sailStates.beta + (6.262161)*sailStates.p + (-108.520645)*sailStates.q + (-4.107876)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (1.397452)*sailStates.alpha + (-0.062705)*sailStates.beta + (-1.583066)*sailStates.p + (6.237280)*sailStates.q + (-0.023138)*sailStates.r + (-0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end