function [aeroForces] = paramSpace_3_2_4_3_3_2_3(sailStates,airStates)

	CL = (3.985610)*sailStates.alpha + (0.029674)*sailStates.beta + (-2.831504)*sailStates.p + (37.074898)*sailStates.q + (0.251277)*sailStates.r + (0.011124)*sailStates.de;
	CD = 0.044930;
	CY = (0.056991)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.028202)*sailStates.p + (0.432842)*sailStates.q + (-0.001803)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.358857)*sailStates.alpha + (-0.025525)*sailStates.beta + (-1.439872)*sailStates.p + (11.953660)*sailStates.q + (0.187676)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.464330)*sailStates.alpha + (-0.138384)*sailStates.beta + (9.677322)*sailStates.p + (-144.575424)*sailStates.q + (-0.890256)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.141985)*sailStates.alpha + (0.001584)*sailStates.beta + (0.023588)*sailStates.p + (-0.864860)*sailStates.q + (-0.008007)*sailStates.r + (-0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end