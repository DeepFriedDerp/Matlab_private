function [aeroForces] = paramSpace_2_1_3_3_1_3_1(sailStates,airStates)

	CL = (4.224244)*sailStates.alpha + (0.116378)*sailStates.beta + (-2.274989)*sailStates.p + (31.777889)*sailStates.q + (0.489928)*sailStates.r + (0.010612)*sailStates.de;
	CD = -0.206430;
	CY = (-0.104227)*sailStates.alpha + (-0.024244)*sailStates.beta + (0.331783)*sailStates.p + (-0.563442)*sailStates.q + (0.021726)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.286836)*sailStates.alpha + (-0.109413)*sailStates.beta + (-1.032900)*sailStates.p + (8.128463)*sailStates.q + (0.526336)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-14.913903)*sailStates.alpha + (-0.491346)*sailStates.beta + (8.024954)*sailStates.p + (-129.238037)*sailStates.q + (-1.662583)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.371706)*sailStates.alpha + (-0.011264)*sailStates.beta + (-0.778542)*sailStates.p + (4.096365)*sailStates.q + (-0.012105)*sailStates.r + (0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end