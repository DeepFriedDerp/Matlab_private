function [aeroForces] = paramSpace_4_4_2_3_3_1_2(sailStates,airStates)

	CL = (3.959188)*sailStates.alpha + (-0.023122)*sailStates.beta + (-2.426157)*sailStates.p + (32.579525)*sailStates.q + (0.188021)*sailStates.r + (0.010062)*sailStates.de;
	CD = -0.118520;
	CY = (0.057782)*sailStates.alpha + (-0.026293)*sailStates.beta + (-0.168046)*sailStates.p + (0.489619)*sailStates.q + (0.033409)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.153982)*sailStates.alpha + (0.054187)*sailStates.beta + (-1.100414)*sailStates.p + (8.595883)*sailStates.q + (-0.065024)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-14.608263)*sailStates.alpha + (0.025255)*sailStates.beta + (8.714240)*sailStates.p + (-134.519470)*sailStates.q + (-0.685799)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.309981)*sailStates.alpha + (-0.005012)*sailStates.beta + (0.549007)*sailStates.p + (-3.417443)*sailStates.q + (-0.052750)*sailStates.r + (-0.000177)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end