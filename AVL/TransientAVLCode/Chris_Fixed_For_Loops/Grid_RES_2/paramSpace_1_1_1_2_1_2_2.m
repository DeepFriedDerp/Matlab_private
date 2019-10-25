function [aeroForces] = paramSpace_1_1_1_2_1_2_2(sailStates,airStates)

	CL = (3.941054)*sailStates.alpha + (0.372844)*sailStates.beta + (-4.885487)*sailStates.p + (49.189091)*sailStates.q + (1.254555)*sailStates.r + (0.010774)*sailStates.de;
	CD = -2.853330;
	CY = (1.107724)*sailStates.alpha + (-0.029699)*sailStates.beta + (0.809459)*sailStates.p + (2.100292)*sailStates.q + (0.106419)*sailStates.r + (0.000467)*sailStates.de;

	Cl = (0.624113)*sailStates.alpha + (-0.426633)*sailStates.beta + (-3.246473)*sailStates.p + (28.128613)*sailStates.q + (1.412522)*sailStates.r + (0.003907)*sailStates.de;
	Cm = (-5.590584)*sailStates.alpha + (-1.489548)*sailStates.beta + (17.865318)*sailStates.p + (-204.582901)*sailStates.q + (-4.170786)*sailStates.r + (-0.076796)*sailStates.de;
	Cn = (-3.822206)*sailStates.alpha + (-0.073413)*sailStates.beta + (-2.313955)*sailStates.p + (10.807555)*sailStates.q + (-0.062238)*sailStates.r + (-0.000302)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end