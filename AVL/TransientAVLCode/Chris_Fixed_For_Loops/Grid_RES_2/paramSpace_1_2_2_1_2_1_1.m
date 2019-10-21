function [aeroForces] = paramSpace_1_2_2_1_2_1_1(sailStates,airStates)

	CL = (5.868882)*sailStates.alpha + (-0.883690)*sailStates.beta + (-6.229245)*sailStates.p + (56.214973)*sailStates.q + (2.699976)*sailStates.r + (0.011109)*sailStates.de;
	CD = -9.259000;
	CY = (3.079064)*sailStates.alpha + (-0.018865)*sailStates.beta + (1.523244)*sailStates.p + (4.591290)*sailStates.q + (0.201840)*sailStates.r + (0.001046)*sailStates.de;

	Cl = (-1.790541)*sailStates.alpha + (-1.104000)*sailStates.beta + (-4.311490)*sailStates.p + (37.039013)*sailStates.q + (2.937983)*sailStates.r + (0.005733)*sailStates.de;
	Cm = (9.696635)*sailStates.alpha + (3.824372)*sailStates.beta + (23.405964)*sailStates.p + (-244.082687)*sailStates.q + (-9.231613)*sailStates.r + (-0.083296)*sailStates.de;
	Cn = (-11.629557)*sailStates.alpha + (-0.109521)*sailStates.beta + (-4.086000)*sailStates.p + (17.152603)*sailStates.q + (-0.081309)*sailStates.r + (-0.000909)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end