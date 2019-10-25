function [aeroForces] = paramSpace_2_1_1_2_3_1_2(sailStates,airStates)

	CL = (4.782568)*sailStates.alpha + (-0.364506)*sailStates.beta + (-2.565348)*sailStates.p + (35.977695)*sailStates.q + (-1.554112)*sailStates.r + (0.011068)*sailStates.de;
	CD = -0.617350;
	CY = (0.098826)*sailStates.alpha + (-0.025851)*sailStates.beta + (-0.698556)*sailStates.p + (0.769435)*sailStates.q + (-0.045867)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.678793)*sailStates.alpha + (0.213263)*sailStates.beta + (-1.251018)*sailStates.p + (10.649819)*sailStates.q + (-1.374225)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.253250)*sailStates.alpha + (1.473297)*sailStates.beta + (8.372533)*sailStates.p + (-135.788696)*sailStates.q + (5.288385)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.211506)*sailStates.alpha + (0.023338)*sailStates.beta + (1.456909)*sailStates.p + (-6.800477)*sailStates.q + (0.010598)*sailStates.r + (-0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end