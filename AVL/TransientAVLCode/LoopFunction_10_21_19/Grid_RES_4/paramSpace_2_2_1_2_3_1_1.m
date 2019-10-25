function [aeroForces] = paramSpace_2_2_1_2_3_1_1(sailStates,airStates)

	CL = (4.780218)*sailStates.alpha + (-0.119554)*sailStates.beta + (-2.182733)*sailStates.p + (32.985218)*sailStates.q + (-1.503016)*sailStates.r + (0.011049)*sailStates.de;
	CD = -0.613050;
	CY = (0.200463)*sailStates.alpha + (-0.025285)*sailStates.beta + (-0.682824)*sailStates.p + (0.668513)*sailStates.q + (-0.044825)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.415985)*sailStates.alpha + (0.281993)*sailStates.beta + (-0.899152)*sailStates.p + (7.273109)*sailStates.q + (-1.330419)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.237351)*sailStates.alpha + (0.484756)*sailStates.beta + (7.096850)*sailStates.p + (-125.787453)*sailStates.q + (5.114830)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.704542)*sailStates.alpha + (0.021513)*sailStates.beta + (1.447898)*sailStates.p + (-6.801988)*sailStates.q + (0.011354)*sailStates.r + (-0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end