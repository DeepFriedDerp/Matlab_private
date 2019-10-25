function [aeroForces] = paramSpace_11_1_3_1_2_1_2(sailStates,airStates)

	CL = (4.820959)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.020728)*sailStates.p + (36.685879)*sailStates.q + (-0.893987)*sailStates.r + (0.010721)*sailStates.de;
	CD = -0.825960;
	CY = (-0.037605)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.599348)*sailStates.p + (0.768920)*sailStates.q + (0.063021)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.780318)*sailStates.alpha + (0.268701)*sailStates.beta + (-1.607284)*sailStates.p + (13.017745)*sailStates.q + (-0.942391)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-15.351882)*sailStates.alpha + (0.000000)*sailStates.beta + (10.961164)*sailStates.p + (-151.567520)*sailStates.q + (2.982322)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.054945)*sailStates.alpha + (-0.028242)*sailStates.beta + (1.483658)*sailStates.p + (-7.918357)*sailStates.q + (-0.039185)*sailStates.r + (-0.000362)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end