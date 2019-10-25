function [aeroForces] = paramSpace_2_3_2_2_3_2_1(sailStates,airStates)

	CL = (4.042575)*sailStates.alpha + (0.033747)*sailStates.beta + (-2.156611)*sailStates.p + (31.761095)*sailStates.q + (-0.485763)*sailStates.r + (0.010838)*sailStates.de;
	CD = 0.014080;
	CY = (0.116082)*sailStates.alpha + (-0.024714)*sailStates.beta + (-0.191121)*sailStates.p + (0.668512)*sailStates.q + (-0.012550)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.040068)*sailStates.alpha + (0.078347)*sailStates.beta + (-0.858283)*sailStates.p + (6.549620)*sailStates.q + (-0.360489)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.518443)*sailStates.alpha + (-0.130762)*sailStates.beta + (7.324092)*sailStates.p + (-125.787453)*sailStates.q + (1.647783)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.210249)*sailStates.alpha + (0.004174)*sailStates.beta + (0.357356)*sailStates.p + (-1.952106)*sailStates.q + (0.003487)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end