function [aeroForces] = paramSpace_4_3_1_3_3_1_1(sailStates,airStates)

	CL = (4.050206)*sailStates.alpha + (0.003313)*sailStates.beta + (-2.194975)*sailStates.p + (30.662663)*sailStates.q + (0.086639)*sailStates.r + (0.010188)*sailStates.de;
	CD = -0.142520;
	CY = (0.104658)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.211746)*sailStates.p + (0.684401)*sailStates.q + (0.042045)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.095398)*sailStates.alpha + (0.077969)*sailStates.beta + (-0.935240)*sailStates.p + (7.082787)*sailStates.q + (-0.159499)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-15.060842)*sailStates.alpha + (-0.049421)*sailStates.beta + (7.975956)*sailStates.p + (-128.521423)*sailStates.q + (-0.330110)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.404485)*sailStates.alpha + (-0.013166)*sailStates.beta + (0.598267)*sailStates.p + (-3.553257)*sailStates.q + (-0.050482)*sailStates.r + (-0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end