function [aeroForces] = paramSpace_2_2_1_2_1_1_1(sailStates,airStates)

	CL = (4.333124)*sailStates.alpha + (-0.100931)*sailStates.beta + (-2.198219)*sailStates.p + (32.900253)*sailStates.q + (-1.101112)*sailStates.r + (0.011051)*sailStates.de;
	CD = -0.365880;
	CY = (-0.038475)*sailStates.alpha + (-0.024574)*sailStates.beta + (-0.434051)*sailStates.p + (-0.870359)*sailStates.q + (-0.028357)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.033502)*sailStates.alpha + (0.228624)*sailStates.beta + (-0.908791)*sailStates.p + (7.246229)*sailStates.q + (-1.002079)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-13.715927)*sailStates.alpha + (0.421250)*sailStates.beta + (7.273486)*sailStates.p + (-126.510948)*sailStates.q + (3.773349)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (-0.309908)*sailStates.alpha + (0.016461)*sailStates.beta + (0.937022)*sailStates.p + (-3.346580)*sailStates.q + (-0.000808)*sailStates.r + (0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end