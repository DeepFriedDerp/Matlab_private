function [aeroForces] = paramSpace_3_4_4_2_2_3_3(sailStates,airStates)

	CL = (4.447799)*sailStates.alpha + (-0.344174)*sailStates.beta + (-2.975236)*sailStates.p + (39.194016)*sailStates.q + (1.406894)*sailStates.r + (0.011270)*sailStates.de;
	CD = -0.484420;
	CY = (0.085762)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.590647)*sailStates.p + (-0.100922)*sailStates.q + (-0.038724)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.442854)*sailStates.alpha + (-0.381913)*sailStates.beta + (-1.486688)*sailStates.p + (12.476674)*sailStates.q + (1.247172)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-13.664718)*sailStates.alpha + (1.404489)*sailStates.beta + (9.803144)*sailStates.p + (-147.195892)*sailStates.q + (-4.800380)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.229693)*sailStates.alpha + (0.017698)*sailStates.beta + (-1.220044)*sailStates.p + (5.178740)*sailStates.q + (0.004303)*sailStates.r + (0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end