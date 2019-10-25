function [aeroForces] = paramSpace_1_2_4_2_3_3_3(sailStates,airStates)

	CL = (4.075562)*sailStates.alpha + (0.004818)*sailStates.beta + (-2.769285)*sailStates.p + (35.033615)*sailStates.q + (-0.299581)*sailStates.r + (0.010243)*sailStates.de;
	CD = -0.234170;
	CY = (0.145068)*sailStates.alpha + (-0.025991)*sailStates.beta + (0.100805)*sailStates.p + (1.057313)*sailStates.q + (0.020165)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.335702)*sailStates.alpha + (-0.100106)*sailStates.beta + (-1.459171)*sailStates.p + (12.253086)*sailStates.q + (0.017286)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-14.849939)*sailStates.alpha + (-0.068890)*sailStates.beta + (9.848082)*sailStates.p + (-144.624481)*sailStates.q + (1.016988)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.065194)*sailStates.alpha + (-0.020113)*sailStates.beta + (-0.503819)*sailStates.p + (2.357116)*sailStates.q + (-0.039559)*sailStates.r + (-0.000277)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end