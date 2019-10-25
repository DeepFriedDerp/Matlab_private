function [aeroForces] = paramSpace_3_1_4_1_3_1_3(sailStates,airStates)

	CL = (6.760780)*sailStates.alpha + (-0.462033)*sailStates.beta + (-3.390407)*sailStates.p + (39.143047)*sailStates.q + (-2.202300)*sailStates.r + (0.010750)*sailStates.de;
	CD = -2.725480;
	CY = (-0.267957)*sailStates.alpha + (-0.022750)*sailStates.beta + (-1.190188)*sailStates.p + (1.471504)*sailStates.q + (0.078164)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (2.810449)*sailStates.alpha + (0.393038)*sailStates.beta + (-1.962439)*sailStates.p + (16.292252)*sailStates.q + (-2.078462)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-15.483125)*sailStates.alpha + (1.728957)*sailStates.beta + (12.325652)*sailStates.p + (-161.242615)*sailStates.q + (7.409104)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.109152)*sailStates.alpha + (-0.042384)*sailStates.beta + (2.762347)*sailStates.p + (-14.247397)*sailStates.q + (-0.036811)*sailStates.r + (-0.000715)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end