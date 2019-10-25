function [aeroForces] = paramSpace_13_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.087556)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.342977)*sailStates.p + (35.071964)*sailStates.q + (1.232556)*sailStates.r + (0.011108)*sailStates.de;
	CD = -0.076990;
	CY = (0.040083)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.339671)*sailStates.p + (0.546500)*sailStates.q + (-0.059952)*sailStates.r + (0.000116)*sailStates.de;

	Cl = (1.112041)*sailStates.alpha + (-0.191640)*sailStates.beta + (-1.022821)*sailStates.p + (8.688563)*sailStates.q + (0.927623)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-13.470060)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.458093)*sailStates.p + (-130.238892)*sailStates.q + (-4.104898)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (0.048389)*sailStates.alpha + (0.033791)*sailStates.beta + (-0.656704)*sailStates.p + (2.192824)*sailStates.q + (-0.016148)*sailStates.r + (-0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end