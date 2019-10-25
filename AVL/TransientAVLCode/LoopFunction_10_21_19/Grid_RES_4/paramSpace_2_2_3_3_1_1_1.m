function [aeroForces] = paramSpace_2_2_3_3_1_1_1(sailStates,airStates)

	CL = (4.189468)*sailStates.alpha + (-0.062918)*sailStates.beta + (-2.328576)*sailStates.p + (33.605709)*sailStates.q + (-0.817573)*sailStates.r + (0.011091)*sailStates.de;
	CD = -0.136410;
	CY = (-0.040529)*sailStates.alpha + (-0.024795)*sailStates.beta + (-0.285394)*sailStates.p + (-0.563442)*sailStates.q + (-0.018726)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.140485)*sailStates.alpha + (0.147787)*sailStates.beta + (-1.020342)*sailStates.p + (8.212935)*sailStates.q + (-0.694211)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-14.271700)*sailStates.alpha + (0.235207)*sailStates.beta + (7.801679)*sailStates.p + (-130.282166)*sailStates.q + (2.769303)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.119323)*sailStates.alpha + (0.010845)*sailStates.beta + (0.608933)*sailStates.p + (-2.222746)*sailStates.q + (-0.001199)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end