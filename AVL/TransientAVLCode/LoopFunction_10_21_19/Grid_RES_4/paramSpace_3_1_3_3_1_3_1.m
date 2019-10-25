function [aeroForces] = paramSpace_3_1_3_3_1_3_1(sailStates,airStates)

	CL = (4.320592)*sailStates.alpha + (0.245314)*sailStates.beta + (-2.298794)*sailStates.p + (33.411030)*sailStates.q + (1.083598)*sailStates.r + (0.010892)*sailStates.de;
	CD = -0.246610;
	CY = (-0.104696)*sailStates.alpha + (-0.025294)*sailStates.beta + (0.460737)*sailStates.p + (-0.432840)*sailStates.q + (-0.030214)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.340295)*sailStates.alpha + (-0.140934)*sailStates.beta + (-1.037316)*sailStates.p + (8.558955)*sailStates.q + (0.930857)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.195949)*sailStates.alpha + (-0.961082)*sailStates.beta + (7.617529)*sailStates.p + (-128.769608)*sailStates.q + (-3.677282)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.323334)*sailStates.alpha + (0.015292)*sailStates.beta + (-0.958725)*sailStates.p + (4.443273)*sailStates.q + (0.006267)*sailStates.r + (0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end