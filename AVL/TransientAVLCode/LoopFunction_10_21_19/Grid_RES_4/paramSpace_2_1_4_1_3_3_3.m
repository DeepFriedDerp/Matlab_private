function [aeroForces] = paramSpace_2_1_4_1_3_3_3(sailStates,airStates)

	CL = (5.124391)*sailStates.alpha + (0.404254)*sailStates.beta + (-3.357284)*sailStates.p + (39.279938)*sailStates.q + (1.347587)*sailStates.r + (0.010834)*sailStates.de;
	CD = -1.728140;
	CY = (0.480486)*sailStates.alpha + (-0.026223)*sailStates.beta + (0.687885)*sailStates.p + (1.915493)*sailStates.q + (0.045289)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.349093)*sailStates.alpha + (-0.331704)*sailStates.beta + (-1.941680)*sailStates.p + (16.349194)*sailStates.q + (1.429605)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.215474)*sailStates.alpha + (-1.726506)*sailStates.beta + (11.948421)*sailStates.p + (-159.650192)*sailStates.q + (-4.632589)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.035671)*sailStates.alpha + (-0.029472)*sailStates.beta + (-1.704746)*sailStates.p + (6.676050)*sailStates.q + (-0.010378)*sailStates.r + (-0.000406)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end