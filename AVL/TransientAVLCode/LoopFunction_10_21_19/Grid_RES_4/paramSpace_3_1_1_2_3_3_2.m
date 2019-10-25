function [aeroForces] = paramSpace_3_1_1_2_3_3_2(sailStates,airStates)

	CL = (4.327950)*sailStates.alpha + (0.244069)*sailStates.beta + (-2.581574)*sailStates.p + (35.843361)*sailStates.q + (1.125998)*sailStates.r + (0.011161)*sailStates.de;
	CD = -0.343180;
	CY = (0.097471)*sailStates.alpha + (-0.024209)*sailStates.beta + (0.405188)*sailStates.p + (0.769434)*sailStates.q + (-0.026639)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.296891)*sailStates.alpha + (-0.158137)*sailStates.beta + (-1.261028)*sailStates.p + (10.620676)*sailStates.q + (0.974392)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-13.888306)*sailStates.alpha + (-0.874364)*sailStates.beta + (8.559067)*sailStates.p + (-136.512222)*sailStates.q + (-3.795863)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.029592)*sailStates.alpha + (0.015493)*sailStates.beta + (-0.880150)*sailStates.p + (3.310601)*sailStates.q + (-0.000876)*sailStates.r + (-0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end