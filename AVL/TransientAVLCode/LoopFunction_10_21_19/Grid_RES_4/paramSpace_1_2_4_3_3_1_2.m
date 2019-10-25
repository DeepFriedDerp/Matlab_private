function [aeroForces] = paramSpace_1_2_4_3_3_1_2(sailStates,airStates)

	CL = (4.376932)*sailStates.alpha + (-0.115299)*sailStates.beta + (-2.516723)*sailStates.p + (37.619118)*sailStates.q + (-1.760145)*sailStates.r + (0.011225)*sailStates.de;
	CD = -0.251170;
	CY = (0.066404)*sailStates.alpha + (-0.025446)*sailStates.beta + (-0.580865)*sailStates.p + (0.489617)*sailStates.q + (-0.115489)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.444421)*sailStates.alpha + (0.232424)*sailStates.beta + (-1.186191)*sailStates.p + (10.742442)*sailStates.q + (-1.361375)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-13.234295)*sailStates.alpha + (0.396372)*sailStates.beta + (7.585940)*sailStates.p + (-134.148560)*sailStates.q + (5.819777)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.051973)*sailStates.alpha + (0.054404)*sailStates.beta + (1.126373)*sailStates.p + (-4.830310)*sailStates.q + (-0.000155)*sailStates.r + (-0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end