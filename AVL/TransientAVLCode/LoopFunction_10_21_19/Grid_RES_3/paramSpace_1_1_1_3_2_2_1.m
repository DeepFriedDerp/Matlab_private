function [aeroForces] = paramSpace_1_1_1_3_2_2_1(sailStates,airStates)

	CL = (3.801493)*sailStates.alpha + (-0.175640)*sailStates.beta + (-2.232136)*sailStates.p + (32.931175)*sailStates.q + (-0.795382)*sailStates.r + (0.010382)*sailStates.de;
	CD = 0.074750;
	CY = (-0.000841)*sailStates.alpha + (-0.024351)*sailStates.beta + (-0.188555)*sailStates.p + (-0.173374)*sailStates.q + (-0.033231)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.134225)*sailStates.alpha + (0.055945)*sailStates.beta + (-1.001301)*sailStates.p + (8.374720)*sailStates.q + (-0.565232)*sailStates.r + (0.000114)*sailStates.de;
	Cm = (-13.472838)*sailStates.alpha + (0.705322)*sailStates.beta + (7.425802)*sailStates.p + (-127.559647)*sailStates.q + (2.706993)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.045040)*sailStates.alpha + (0.015462)*sailStates.beta + (0.272463)*sailStates.p + (-0.480877)*sailStates.q + (-0.020725)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end