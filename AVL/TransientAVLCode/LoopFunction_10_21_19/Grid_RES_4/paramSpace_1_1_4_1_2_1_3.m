function [aeroForces] = paramSpace_1_1_4_1_2_1_3(sailStates,airStates)

	CL = (6.137361)*sailStates.alpha + (-0.741248)*sailStates.beta + (-3.485003)*sailStates.p + (50.136822)*sailStates.q + (-3.558740)*sailStates.r + (0.012637)*sailStates.de;
	CD = -2.403200;
	CY = (-0.407697)*sailStates.alpha + (-0.026687)*sailStates.beta + (-1.335382)*sailStates.p + (0.662183)*sailStates.q + (-0.265553)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (2.088761)*sailStates.alpha + (0.394495)*sailStates.beta + (-1.955413)*sailStates.p + (19.253374)*sailStates.q + (-3.014589)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-10.169215)*sailStates.alpha + (2.690507)*sailStates.beta + (9.405910)*sailStates.p + (-157.701111)*sailStates.q + (11.746362)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (1.956894)*sailStates.alpha + (0.131660)*sailStates.beta + (2.692366)*sailStates.p + (-11.243088)*sailStates.q + (0.012963)*sailStates.r + (-0.000488)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end