function [aeroForces] = paramSpace_4_1_1_3_1_1_3(sailStates,airStates)

	CL = (3.907456)*sailStates.alpha + (0.051013)*sailStates.beta + (-2.648754)*sailStates.p + (34.829178)*sailStates.q + (0.530566)*sailStates.r + (0.010267)*sailStates.de;
	CD = -0.051580;
	CY = (-0.083096)*sailStates.alpha + (-0.026751)*sailStates.beta + (0.004090)*sailStates.p + (-0.684401)*sailStates.q + (-0.000740)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.337123)*sailStates.alpha + (0.063038)*sailStates.beta + (-1.382994)*sailStates.p + (11.814292)*sailStates.q + (0.218330)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-14.433565)*sailStates.alpha + (-0.054184)*sailStates.beta + (9.198755)*sailStates.p + (-140.146637)*sailStates.q + (-1.778918)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.142110)*sailStates.alpha + (-0.009662)*sailStates.beta + (0.237539)*sailStates.p + (-1.385669)*sailStates.q + (-0.036393)*sailStates.r + (0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end