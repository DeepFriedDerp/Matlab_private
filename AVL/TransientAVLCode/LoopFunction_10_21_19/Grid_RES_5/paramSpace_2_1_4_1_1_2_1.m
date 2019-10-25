function [aeroForces] = paramSpace_2_1_4_1_1_2_1(sailStates,airStates)

	CL = (4.645375)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.907354)*sailStates.p + (26.044437)*sailStates.q + (0.717031)*sailStates.r + (0.009548)*sailStates.de;
	CD = -0.803360;
	CY = (-0.279814)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.595461)*sailStates.p + (-1.364609)*sailStates.q + (0.126422)*sailStates.r + (-0.000286)*sailStates.de;

	Cl = (1.247442)*sailStates.alpha + (-0.243650)*sailStates.beta + (-0.742103)*sailStates.p + (4.701989)*sailStates.q + (0.891270)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-16.374838)*sailStates.alpha + (0.000000)*sailStates.beta + (7.788621)*sailStates.p + (-122.335159)*sailStates.q + (-2.282495)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (1.032887)*sailStates.alpha + (-0.051789)*sailStates.beta + (-1.427048)*sailStates.p + (7.637714)*sailStates.q + (-0.080481)*sailStates.r + (0.000484)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end