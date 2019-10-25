function [aeroForces] = paramSpace_2_2_1_2_3_3_3(sailStates,airStates)

	CL = (4.209161)*sailStates.alpha + (0.032783)*sailStates.beta + (-2.934370)*sailStates.p + (37.087498)*sailStates.q + (0.407897)*sailStates.r + (0.010949)*sailStates.de;
	CD = -0.277160;
	CY = (0.146578)*sailStates.alpha + (-0.025379)*sailStates.beta + (0.237912)*sailStates.p + (0.870357)*sailStates.q + (0.015502)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.392265)*sailStates.alpha + (-0.145913)*sailStates.beta + (-1.539568)*sailStates.p + (12.733133)*sailStates.q + (0.470637)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.541287)*sailStates.alpha + (-0.114702)*sailStates.beta + (10.229821)*sailStates.p + (-147.878265)*sailStates.q + (-1.360810)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.100178)*sailStates.alpha + (-0.010341)*sailStates.beta + (-0.669200)*sailStates.p + (2.873853)*sailStates.q + (-0.006501)*sailStates.r + (-0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end