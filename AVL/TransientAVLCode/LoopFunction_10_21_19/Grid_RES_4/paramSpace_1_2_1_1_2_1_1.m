function [aeroForces] = paramSpace_1_2_1_1_2_1_1(sailStates,airStates)

	CL = (6.231922)*sailStates.alpha + (-0.238124)*sailStates.beta + (-1.797162)*sailStates.p + (36.021385)*sailStates.q + (-2.906568)*sailStates.r + (0.011671)*sailStates.de;
	CD = -2.362110;
	CY = (0.347151)*sailStates.alpha + (-0.024203)*sailStates.beta + (-1.169844)*sailStates.p + (-0.662190)*sailStates.q + (-0.232625)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.348741)*sailStates.alpha + (0.551097)*sailStates.beta + (-0.532690)*sailStates.p + (5.465897)*sailStates.q + (-2.522330)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-8.925639)*sailStates.alpha + (0.927623)*sailStates.beta + (3.934752)*sailStates.p + (-110.966957)*sailStates.q + (9.637732)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-1.992767)*sailStates.alpha + (0.124238)*sailStates.beta + (2.605295)*sailStates.p + (-11.013453)*sailStates.q + (0.037114)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end