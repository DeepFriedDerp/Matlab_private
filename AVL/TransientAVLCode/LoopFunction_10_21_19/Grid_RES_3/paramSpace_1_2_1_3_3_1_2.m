function [aeroForces] = paramSpace_1_2_1_3_3_1_2(sailStates,airStates)

	CL = (4.328104)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.533517)*sailStates.p + (37.445660)*sailStates.q + (-1.677680)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.246050;
	CY = (0.066024)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.600502)*sailStates.p + (0.491627)*sailStates.q + (-0.105932)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.432684)*sailStates.alpha + (0.280644)*sailStates.beta + (-1.180309)*sailStates.p + (10.460929)*sailStates.q + (-1.352258)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.057076)*sailStates.alpha + (0.000000)*sailStates.beta + (7.770082)*sailStates.p + (-134.907364)*sailStates.q + (5.624734)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (-0.078913)*sailStates.alpha + (0.049485)*sailStates.beta + (1.157648)*sailStates.p + (-4.843609)*sailStates.q + (0.002213)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end