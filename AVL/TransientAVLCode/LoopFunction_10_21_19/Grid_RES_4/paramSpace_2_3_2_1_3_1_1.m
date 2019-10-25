function [aeroForces] = paramSpace_2_3_2_1_3_1_1(sailStates,airStates)

	CL = (7.340312)*sailStates.alpha + (0.215165)*sailStates.beta + (-1.722813)*sailStates.p + (30.562073)*sailStates.q + (-2.885512)*sailStates.r + (0.011160)*sailStates.de;
	CD = -2.966530;
	CY = (0.701164)*sailStates.alpha + (-0.024400)*sailStates.beta + (-1.370861)*sailStates.p + (1.471501)*sailStates.q + (-0.089903)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.190879)*sailStates.alpha + (0.686856)*sailStates.beta + (-0.476693)*sailStates.p + (3.610305)*sailStates.q + (-2.584749)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-14.010181)*sailStates.alpha + (-0.838115)*sailStates.beta + (5.113775)*sailStates.p + (-112.102478)*sailStates.q + (9.770895)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.686475)*sailStates.alpha + (0.038976)*sailStates.beta + (3.007387)*sailStates.p + (-14.706532)*sailStates.q + (0.029765)*sailStates.r + (-0.000621)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end