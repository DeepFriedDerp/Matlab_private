function [aeroForces] = paramSpace_1_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.554548)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.698714)*sailStates.p + (42.057621)*sailStates.q + (-2.695749)*sailStates.r + (0.012166)*sailStates.de;
	CD = -1.844280;
	CY = (-0.236923)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.967892)*sailStates.p + (-1.671350)*sailStates.q + (-0.170665)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.120903)*sailStates.alpha + (0.550615)*sailStates.beta + (-1.250172)*sailStates.p + (11.674638)*sailStates.q + (-2.338304)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-10.137223)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.515086)*sailStates.p + (-137.643188)*sailStates.q + (8.998469)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.106962)*sailStates.alpha + (0.097088)*sailStates.beta + (2.065146)*sailStates.p + (-7.389853)*sailStates.q + (-0.009296)*sailStates.r + (0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end