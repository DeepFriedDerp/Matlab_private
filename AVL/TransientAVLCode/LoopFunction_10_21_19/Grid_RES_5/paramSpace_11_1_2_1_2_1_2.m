function [aeroForces] = paramSpace_11_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.860926)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.021191)*sailStates.p + (36.659187)*sailStates.q + (-0.903457)*sailStates.r + (0.010770)*sailStates.de;
	CD = -0.849780;
	CY = (-0.040808)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.614383)*sailStates.p + (0.768920)*sailStates.q + (0.064547)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.787038)*sailStates.alpha + (0.276216)*sailStates.beta + (-1.607505)*sailStates.p + (13.016547)*sailStates.q + (-0.966756)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-15.467620)*sailStates.alpha + (0.000000)*sailStates.beta + (10.967006)*sailStates.p + (-151.567520)*sailStates.q + (3.037912)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.065557)*sailStates.alpha + (-0.029031)*sailStates.beta + (1.505953)*sailStates.p + (-7.929747)*sailStates.q + (-0.038926)*sailStates.r + (-0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end