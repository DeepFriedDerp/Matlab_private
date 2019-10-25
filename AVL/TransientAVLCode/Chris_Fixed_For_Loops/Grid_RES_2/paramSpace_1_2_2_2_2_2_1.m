function [aeroForces] = paramSpace_1_2_2_2_2_2_1(sailStates,airStates)

	CL = (6.200334)*sailStates.alpha + (-0.904157)*sailStates.beta + (-6.237839)*sailStates.p + (56.112408)*sailStates.q + (2.794455)*sailStates.r + (0.011079)*sailStates.de;
	CD = -9.630580;
	CY = (3.158101)*sailStates.alpha + (-0.018950)*sailStates.beta + (1.570672)*sailStates.p + (4.525230)*sailStates.q + (0.208065)*sailStates.r + (0.001031)*sailStates.de;

	Cl = (-1.714934)*sailStates.alpha + (-1.131008)*sailStates.beta + (-4.320274)*sailStates.p + (37.073402)*sailStates.q + (3.024287)*sailStates.r + (0.005753)*sailStates.de;
	Cm = (9.841903)*sailStates.alpha + (3.903081)*sailStates.beta + (23.494194)*sailStates.p + (-244.460648)*sailStates.q + (-9.547570)*sailStates.r + (-0.083364)*sailStates.de;
	Cn = (-11.950448)*sailStates.alpha + (-0.111926)*sailStates.beta + (-4.192291)*sailStates.p + (17.688410)*sailStates.q + (-0.083771)*sailStates.r + (-0.000874)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end