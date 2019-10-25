function [aeroForces] = paramSpace_2_3_1_2_1_1_3(sailStates,airStates)

	CL = (4.301100)*sailStates.alpha + (0.105965)*sailStates.beta + (-3.002510)*sailStates.p + (39.417862)*sailStates.q + (-1.208581)*sailStates.r + (0.011442)*sailStates.de;
	CD = -0.370930;
	CY = (-0.163386)*sailStates.alpha + (-0.025285)*sailStates.beta + (-0.467007)*sailStates.p + (-0.668511)*sailStates.q + (-0.030539)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.327985)*sailStates.alpha + (0.287267)*sailStates.beta + (-1.533222)*sailStates.p + (12.940064)*sailStates.q + (-1.087190)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-13.617242)*sailStates.alpha + (-0.438767)*sailStates.beta + (9.958066)*sailStates.p + (-148.601761)*sailStates.q + (4.138817)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.317285)*sailStates.alpha + (0.017152)*sailStates.beta + (0.963502)*sailStates.p + (-3.426567)*sailStates.q + (-0.001948)*sailStates.r + (0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end