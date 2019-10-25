function [aeroForces] = paramSpace_1_1_1_2_3_2_1(sailStates,airStates)

	CL = (3.853849)*sailStates.alpha + (-0.193698)*sailStates.beta + (-2.074197)*sailStates.p + (31.880203)*sailStates.q + (-0.941259)*sailStates.r + (0.010317)*sailStates.de;
	CD = 0.044570;
	CY = (0.113195)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.294555)*sailStates.p + (0.491415)*sailStates.q + (-0.051985)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.122468)*sailStates.alpha + (0.075259)*sailStates.beta + (-0.875729)*sailStates.p + (7.330007)*sailStates.q + (-0.685023)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-13.350817)*sailStates.alpha + (0.764789)*sailStates.beta + (6.745554)*sailStates.p + (-122.751343)*sailStates.q + (3.177135)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.191129)*sailStates.alpha + (0.023177)*sailStates.beta + (0.514934)*sailStates.p + (-2.178422)*sailStates.q + (-0.002902)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end