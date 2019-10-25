function [aeroForces] = paramSpace_2_4_4_3_2_3_2(sailStates,airStates)

	CL = (4.179905)*sailStates.alpha + (-0.115212)*sailStates.beta + (-2.530467)*sailStates.p + (33.897305)*sailStates.q + (0.334552)*sailStates.r + (0.010762)*sailStates.de;
	CD = -0.159500;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.255580)*sailStates.p + (-0.000000)*sailStates.q + (0.016752)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.198708)*sailStates.alpha + (-0.149341)*sailStates.beta + (-1.144789)*sailStates.p + (8.900542)*sailStates.q + (0.422384)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.867230)*sailStates.alpha + (0.550513)*sailStates.beta + (8.839889)*sailStates.p + (-136.150452)*sailStates.q + (-1.165299)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.170739)*sailStates.alpha + (-0.007035)*sailStates.beta + (-0.621015)*sailStates.p + (2.892678)*sailStates.q + (-0.008409)*sailStates.r + (0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end