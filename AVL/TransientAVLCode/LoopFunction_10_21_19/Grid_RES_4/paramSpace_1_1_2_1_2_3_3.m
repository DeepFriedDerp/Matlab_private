function [aeroForces] = paramSpace_1_1_2_1_2_3_3(sailStates,airStates)

	CL = (5.293105)*sailStates.alpha + (0.261253)*sailStates.beta + (-3.143057)*sailStates.p + (34.370586)*sailStates.q + (0.925502)*sailStates.r + (0.009297)*sailStates.de;
	CD = -1.890340;
	CY = (0.336252)*sailStates.alpha + (-0.026962)*sailStates.beta + (0.699512)*sailStates.p + (0.662186)*sailStates.q + (0.139118)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.804469)*sailStates.alpha + (-0.324513)*sailStates.beta + (-1.846975)*sailStates.p + (15.069235)*sailStates.q + (1.114155)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-14.732448)*sailStates.alpha + (-1.037269)*sailStates.beta + (12.328341)*sailStates.p + (-157.701111)*sailStates.q + (-2.945688)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-0.645783)*sailStates.alpha + (-0.089158)*sailStates.beta + (-1.960024)*sailStates.p + (9.791998)*sailStates.q + (-0.095136)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end