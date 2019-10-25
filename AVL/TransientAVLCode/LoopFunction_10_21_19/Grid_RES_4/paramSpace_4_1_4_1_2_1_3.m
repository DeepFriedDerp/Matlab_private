function [aeroForces] = paramSpace_4_1_4_1_2_1_3(sailStates,airStates)

	CL = (5.220452)*sailStates.alpha + (-0.241373)*sailStates.beta + (-3.142182)*sailStates.p + (34.419567)*sailStates.q + (-0.916109)*sailStates.r + (0.009207)*sailStates.de;
	CD = -1.843610;
	CY = (-0.330713)*sailStates.alpha + (-0.027100)*sailStates.beta + (-0.684938)*sailStates.p + (-0.662185)*sailStates.q + (0.136172)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.800069)*sailStates.alpha + (0.319134)*sailStates.beta + (-1.846541)*sailStates.p + (15.071403)*sailStates.q + (-1.090063)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-14.534169)*sailStates.alpha + (0.903292)*sailStates.beta + (12.317008)*sailStates.p + (-157.701111)*sailStates.q + (2.888719)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.627697)*sailStates.alpha + (-0.088037)*sailStates.beta + (1.938007)*sailStates.p + (-9.781098)*sailStates.q + (-0.095681)*sailStates.r + (-0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end