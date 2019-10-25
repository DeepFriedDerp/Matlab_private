function [aeroForces] = paramSpace_1_3_1_3_3_2_3(sailStates,airStates)

	CL = (3.844714)*sailStates.alpha + (0.089548)*sailStates.beta + (-2.715242)*sailStates.p + (37.572838)*sailStates.q + (-1.225765)*sailStates.r + (0.010625)*sailStates.de;
	CD = 0.078750;
	CY = (0.049363)*sailStates.alpha + (-0.024177)*sailStates.beta + (-0.352212)*sailStates.p + (0.684402)*sailStates.q + (-0.070133)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.332641)*sailStates.alpha + (0.176254)*sailStates.beta + (-1.343543)*sailStates.p + (11.718859)*sailStates.q + (-0.895163)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-13.325355)*sailStates.alpha + (-0.349149)*sailStates.beta + (8.798136)*sailStates.p + (-141.172913)*sailStates.q + (4.130849)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.162431)*sailStates.alpha + (0.029963)*sailStates.beta + (0.532261)*sailStates.p + (-1.902101)*sailStates.q + (-0.019191)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end