function [aeroForces] = paramSpace_4_3_4_1_2_3_1(sailStates,airStates)

	CL = (6.231922)*sailStates.alpha + (-0.238124)*sailStates.beta + (-1.797162)*sailStates.p + (36.021385)*sailStates.q + (2.906569)*sailStates.r + (0.011671)*sailStates.de;
	CD = -2.362110;
	CY = (-0.347151)*sailStates.alpha + (-0.025749)*sailStates.beta + (1.169844)*sailStates.p + (0.662190)*sailStates.q + (-0.232625)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (1.299389)*sailStates.alpha + (-0.669720)*sailStates.beta + (-0.501158)*sailStates.p + (5.068928)*sailStates.q + (2.516014)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-8.925638)*sailStates.alpha + (0.927623)*sailStates.beta + (3.934752)*sailStates.p + (-110.966957)*sailStates.q + (-9.637729)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (2.058016)*sailStates.alpha + (0.118598)*sailStates.beta + (-2.611567)*sailStates.p + (11.092415)*sailStates.q + (0.038370)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end