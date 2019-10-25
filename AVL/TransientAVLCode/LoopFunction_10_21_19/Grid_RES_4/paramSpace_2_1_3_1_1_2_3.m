function [aeroForces] = paramSpace_2_1_3_1_1_2_3(sailStates,airStates)

	CL = (3.705746)*sailStates.alpha + (-0.012788)*sailStates.beta + (-3.449034)*sailStates.p + (41.768803)*sailStates.q + (0.000304)*sailStates.r + (0.011352)*sailStates.de;
	CD = -0.007570;
	CY = (-0.117646)*sailStates.alpha + (-0.023372)*sailStates.beta + (0.170421)*sailStates.p + (-1.471502)*sailStates.q + (0.011118)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.460758)*sailStates.alpha + (-0.028636)*sailStates.beta + (-1.981084)*sailStates.p + (16.992857)*sailStates.q + (0.048682)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-13.431171)*sailStates.alpha + (0.026164)*sailStates.beta + (11.839755)*sailStates.p + (-161.242615)*sailStates.q + (0.004254)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (0.107943)*sailStates.alpha + (-0.004373)*sailStates.beta + (-0.449348)*sailStates.p + (3.558220)*sailStates.q + (-0.017707)*sailStates.r + (0.000448)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end