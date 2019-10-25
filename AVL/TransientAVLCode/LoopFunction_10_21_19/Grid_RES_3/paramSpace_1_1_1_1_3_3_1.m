function [aeroForces] = paramSpace_1_1_1_1_3_3_1(sailStates,airStates)

	CL = (4.654016)*sailStates.alpha + (0.262702)*sailStates.beta + (-1.429525)*sailStates.p + (21.003462)*sailStates.q + (1.237391)*sailStates.r + (0.008741)*sailStates.de;
	CD = -1.566890;
	CY = (-0.125925)*sailStates.alpha + (-0.027824)*sailStates.beta + (0.647668)*sailStates.p + (1.081940)*sailStates.q + (0.114098)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.498615)*sailStates.alpha + (-0.284723)*sailStates.beta + (-0.428286)*sailStates.p + (1.837933)*sailStates.q + (1.346031)*sailStates.r + (-0.000764)*sailStates.de;
	Cm = (-14.330713)*sailStates.alpha + (-0.993422)*sailStates.beta + (6.252821)*sailStates.p + (-108.520653)*sailStates.q + (-4.054910)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (1.320089)*sailStates.alpha + (-0.067643)*sailStates.beta + (-1.569517)*sailStates.p + (6.409099)*sailStates.q + (-0.026051)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end