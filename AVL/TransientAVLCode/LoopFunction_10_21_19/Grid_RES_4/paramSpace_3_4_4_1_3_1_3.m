function [aeroForces] = paramSpace_3_4_4_1_3_1_3(sailStates,airStates)

	CL = (6.760780)*sailStates.alpha + (0.462033)*sailStates.beta + (-3.390407)*sailStates.p + (39.143047)*sailStates.q + (-2.202300)*sailStates.r + (0.010750)*sailStates.de;
	CD = -2.725480;
	CY = (-0.267957)*sailStates.alpha + (-0.026822)*sailStates.beta + (-1.190188)*sailStates.p + (1.471504)*sailStates.q + (0.078164)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (2.688971)*sailStates.alpha + (0.670717)*sailStates.beta + (-1.864752)*sailStates.p + (15.083688)*sailStates.q + (-2.084992)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-15.483125)*sailStates.alpha + (-1.728958)*sailStates.beta + (12.325652)*sailStates.p + (-161.242615)*sailStates.q + (7.409104)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (0.976687)*sailStates.alpha + (-0.027338)*sailStates.beta + (2.755944)*sailStates.p + (-14.168184)*sailStates.q + (-0.036383)*sailStates.r + (-0.000715)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end