function [aeroForces] = paramSpace_1_2_2_1_1_2_2(sailStates,airStates)

	CL = (3.805398)*sailStates.alpha + (-0.052427)*sailStates.beta + (-2.528901)*sailStates.p + (35.032261)*sailStates.q + (-0.564595)*sailStates.r + (0.010600)*sailStates.de;
	CD = 0.063990;
	CY = (-0.202270)*sailStates.alpha + (-0.023148)*sailStates.beta + (0.035566)*sailStates.p + (-1.664521)*sailStates.q + (0.007134)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.181057)*sailStates.alpha + (0.035950)*sailStates.beta + (-1.209247)*sailStates.p + (10.019679)*sailStates.q + (-0.342484)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-13.835888)*sailStates.alpha + (0.204530)*sailStates.beta + (8.736551)*sailStates.p + (-137.222183)*sailStates.q + (1.962859)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.397606)*sailStates.alpha + (0.005962)*sailStates.beta + (-0.241765)*sailStates.p + (3.140322)*sailStates.q + (-0.068486)*sailStates.r + (0.000493)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end