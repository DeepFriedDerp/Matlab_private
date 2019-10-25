function [aeroForces] = paramSpace_4_2_2_1_2_3_3(sailStates,airStates)

	CL = (6.192640)*sailStates.alpha + (0.255565)*sailStates.beta + (-3.502858)*sailStates.p + (50.454144)*sailStates.q + (3.576352)*sailStates.r + (0.012724)*sailStates.de;
	CD = -2.426580;
	CY = (0.413215)*sailStates.alpha + (-0.025657)*sailStates.beta + (1.351589)*sailStates.p + (-0.662188)*sailStates.q + (-0.268824)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.084198)*sailStates.alpha + (-0.567796)*sailStates.beta + (-1.932393)*sailStates.p + (18.935480)*sailStates.q + (3.037581)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-10.155958)*sailStates.alpha + (-0.945604)*sailStates.beta + (9.456808)*sailStates.p + (-158.727341)*sailStates.q + (-11.828364)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.913927)*sailStates.alpha + (0.130906)*sailStates.beta + (-2.722828)*sailStates.p + (11.337802)*sailStates.q + (0.013810)*sailStates.r + (0.000476)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end