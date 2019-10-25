function [aeroForces] = paramSpace_2_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.276189)*sailStates.alpha + (-0.541759)*sailStates.beta + (-1.737201)*sailStates.p + (30.125061)*sailStates.q + (-2.005666)*sailStates.r + (0.010966)*sailStates.de;
	CD = -1.825590;
	CY = (0.059746)*sailStates.alpha + (-0.022135)*sailStates.beta + (-0.837295)*sailStates.p + (-1.915493)*sailStates.q + (-0.054677)*sailStates.r + (-0.000404)*sailStates.de;

	Cl = (0.602807)*sailStates.alpha + (0.365090)*sailStates.beta + (-0.553793)*sailStates.p + (4.283642)*sailStates.q + (-1.887559)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-11.241083)*sailStates.alpha + (2.221030)*sailStates.beta + (5.433212)*sailStates.p + (-112.650780)*sailStates.q + (6.850721)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-1.356623)*sailStates.alpha + (0.032396)*sailStates.beta + (1.899435)*sailStates.p + (-7.058360)*sailStates.q + (0.002502)*sailStates.r + (0.000421)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end