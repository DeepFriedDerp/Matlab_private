function [aeroForces] = paramSpace_15_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.292809)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.103634)*sailStates.p + (36.848946)*sailStates.q + (2.054997)*sailStates.r + (0.011135)*sailStates.de;
	CD = -0.583450;
	CY = (0.050170)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.658373)*sailStates.p + (1.423511)*sailStates.q + (-0.163996)*sailStates.r + (0.000296)*sailStates.de;

	Cl = (0.865314)*sailStates.alpha + (-0.385115)*sailStates.beta + (-0.800622)*sailStates.p + (7.532882)*sailStates.q + (1.681488)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-9.885921)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.641211)*sailStates.p + (-121.603668)*sailStates.q + (-6.793628)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (0.496952)*sailStates.alpha + (0.096020)*sailStates.beta + (-1.390932)*sailStates.p + (4.557707)*sailStates.q + (-0.023232)*sailStates.r + (-0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end