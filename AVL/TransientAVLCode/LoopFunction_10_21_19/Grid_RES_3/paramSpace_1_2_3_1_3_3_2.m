function [aeroForces] = paramSpace_1_2_3_1_3_3_2(sailStates,airStates)

	CL = (5.234018)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.307507)*sailStates.p + (28.369190)*sailStates.q + (0.945649)*sailStates.r + (0.009443)*sailStates.de;
	CD = -1.610320;
	CY = (0.187258)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.590668)*sailStates.p + (1.671350)*sailStates.q + (0.104310)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.112305)*sailStates.alpha + (-0.362017)*sailStates.beta + (-1.099612)*sailStates.p + (8.098879)*sailStates.q + (1.160840)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-15.786063)*sailStates.alpha + (0.000000)*sailStates.beta + (9.129066)*sailStates.p + (-133.415192)*sailStates.q + (-3.133761)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (0.296183)*sailStates.alpha + (-0.063833)*sailStates.beta + (-1.546597)*sailStates.p + (6.186737)*sailStates.q + (-0.034387)*sailStates.r + (-0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end