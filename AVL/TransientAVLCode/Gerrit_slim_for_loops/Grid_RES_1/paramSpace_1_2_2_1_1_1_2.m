function [aeroForces] = paramSpace_1_2_2_1_1_1_2(sailStates,airStates)

	CL = (7.594933)*sailStates.alpha + (-0.532148)*sailStates.beta + (-2.563358)*sailStates.p + (29.584814)*sailStates.q + (0.295149)*sailStates.r + (0.008882)*sailStates.de;
	CD = -4.602980;
	CY = (1.840283)*sailStates.alpha + (-0.005442)*sailStates.beta + (-0.217598)*sailStates.p + (14.999655)*sailStates.q + (-0.024398)*sailStates.r + (0.003194)*sailStates.de;

	Cl = (-1.751315)*sailStates.alpha + (-0.508530)*sailStates.beta + (-1.356888)*sailStates.p + (11.154141)*sailStates.q + (0.960272)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-13.214094)*sailStates.alpha + (2.605805)*sailStates.beta + (9.236609)*sailStates.p + (-137.766205)*sailStates.q + (-1.258773)*sailStates.r + (-0.068369)*sailStates.de;
	Cn = (-1.909072)*sailStates.alpha + (-0.073501)*sailStates.beta + (-0.093455)*sailStates.p + (-10.454178)*sailStates.q + (0.128756)*sailStates.r + (-0.004262)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end