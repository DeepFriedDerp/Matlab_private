function [aeroForces] = paramSpace_3_2_3_2_1_2_1(sailStates,airStates)

	CL = (4.042575)*sailStates.alpha + (0.033747)*sailStates.beta + (-2.156611)*sailStates.p + (31.761095)*sailStates.q + (0.485763)*sailStates.r + (0.010838)*sailStates.de;
	CD = 0.014080;
	CY = (-0.116082)*sailStates.alpha + (-0.025238)*sailStates.beta + (0.191121)*sailStates.p + (-0.668512)*sailStates.q + (-0.012550)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.095583)*sailStates.alpha + (-0.058446)*sailStates.beta + (-0.890931)*sailStates.p + (6.953496)*sailStates.q + (0.362643)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.518442)*sailStates.alpha + (-0.130762)*sailStates.beta + (7.324092)*sailStates.p + (-125.787453)*sailStates.q + (-1.647783)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.200605)*sailStates.alpha + (0.004792)*sailStates.beta + (-0.355216)*sailStates.p + (1.925635)*sailStates.q + (0.003346)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end