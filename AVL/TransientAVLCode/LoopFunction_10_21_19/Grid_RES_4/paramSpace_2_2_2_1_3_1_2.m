function [aeroForces] = paramSpace_2_2_2_1_3_1_2(sailStates,airStates)

	CL = (7.676106)*sailStates.alpha + (-0.220562)*sailStates.beta + (-2.607471)*sailStates.p + (37.730007)*sailStates.q + (-3.002326)*sailStates.r + (0.011558)*sailStates.de;
	CD = -2.990710;
	CY = (0.227783)*sailStates.alpha + (-0.025640)*sailStates.beta + (-1.406870)*sailStates.p + (1.693495)*sailStates.q + (-0.092271)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (2.924654)*sailStates.alpha + (0.568887)*sailStates.beta + (-1.232034)*sailStates.p + (10.720585)*sailStates.q + (-2.682124)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-15.289208)*sailStates.alpha + (0.856573)*sailStates.beta + (8.066901)*sailStates.p + (-136.398376)*sailStates.q + (10.164094)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.576071)*sailStates.alpha + (0.043530)*sailStates.beta + (3.031666)*sailStates.p + (-14.739119)*sailStates.q + (0.028229)*sailStates.r + (-0.000733)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end