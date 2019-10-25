function [aeroForces] = paramSpace_3_1_2_1_3_1_1(sailStates,airStates)

	CL = (6.961636)*sailStates.alpha + (-0.536644)*sailStates.beta + (-1.621570)*sailStates.p + (24.774237)*sailStates.q + (-2.453169)*sailStates.r + (0.009975)*sailStates.de;
	CD = -2.855390;
	CY = (0.694060)*sailStates.alpha + (-0.022945)*sailStates.beta + (-1.291953)*sailStates.p + (1.915489)*sailStates.q + (0.084612)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (2.145029)*sailStates.alpha + (0.401108)*sailStates.beta + (-0.517300)*sailStates.p + (2.877942)*sailStates.q + (-2.316578)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-16.531939)*sailStates.alpha + (2.112107)*sailStates.beta + (6.426014)*sailStates.p + (-112.650780)*sailStates.q + (8.296508)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.575256)*sailStates.alpha + (-0.042706)*sailStates.beta + (2.859134)*sailStates.p + (-14.388484)*sailStates.q + (-0.033302)*sailStates.r + (-0.000740)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end