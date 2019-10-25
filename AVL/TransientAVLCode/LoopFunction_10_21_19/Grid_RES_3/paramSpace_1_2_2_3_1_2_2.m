function [aeroForces] = paramSpace_1_2_2_3_1_2_2(sailStates,airStates)

	CL = (3.888741)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.515677)*sailStates.p + (35.170280)*sailStates.q + (-0.754142)*sailStates.r + (0.010753)*sailStates.de;
	CD = 0.066140;
	CY = (-0.061646)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.119873)*sailStates.p + (-0.491627)*sailStates.q + (-0.021137)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.186664)*sailStates.alpha + (0.079547)*sailStates.beta + (-1.182748)*sailStates.p + (9.865289)*sailStates.q + (-0.500804)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-13.972914)*sailStates.alpha + (0.000000)*sailStates.beta + (8.466209)*sailStates.p + (-136.151047)*sailStates.q + (2.553043)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.188579)*sailStates.alpha + (0.014026)*sailStates.beta + (0.109363)*sailStates.p + (0.505989)*sailStates.q + (-0.032249)*sailStates.r + (0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end