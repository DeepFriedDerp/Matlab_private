function [aeroForces] = paramSpace_3_3_4_3_3_3_1(sailStates,airStates)

	CL = (4.170513)*sailStates.alpha + (-0.077296)*sailStates.beta + (-2.328133)*sailStates.p + (33.638729)*sailStates.q + (0.834287)*sailStates.r + (0.011030)*sailStates.de;
	CD = -0.137460;
	CY = (0.037303)*sailStates.alpha + (-0.025237)*sailStates.beta + (0.315208)*sailStates.p + (0.563442)*sailStates.q + (-0.020600)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.083170)*sailStates.alpha + (-0.197800)*sailStates.beta + (-0.987469)*sailStates.p + (7.810581)*sailStates.q + (0.739517)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-14.128768)*sailStates.alpha + (0.326519)*sailStates.beta + (7.795372)*sailStates.p + (-130.282166)*sailStates.q + (-2.865527)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.145365)*sailStates.alpha + (0.011887)*sailStates.beta + (-0.655132)*sailStates.p + (2.272496)*sailStates.q + (-0.001676)*sailStates.r + (-0.000124)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end