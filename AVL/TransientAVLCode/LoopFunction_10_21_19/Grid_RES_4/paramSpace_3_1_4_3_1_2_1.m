function [aeroForces] = paramSpace_3_1_4_3_1_2_1(sailStates,airStates)

	CL = (3.974467)*sailStates.alpha + (0.114353)*sailStates.beta + (-2.281553)*sailStates.p + (32.646538)*sailStates.q + (0.439302)*sailStates.r + (0.010706)*sailStates.de;
	CD = 0.033700;
	CY = (-0.072032)*sailStates.alpha + (-0.025385)*sailStates.beta + (0.167191)*sailStates.p + (-0.432842)*sailStates.q + (-0.011004)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.205643)*sailStates.alpha + (-0.037541)*sailStates.beta + (-1.031816)*sailStates.p + (8.353544)*sailStates.q + (0.343926)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.324468)*sailStates.alpha + (-0.499723)*sailStates.beta + (7.759377)*sailStates.p + (-128.769608)*sailStates.q + (-1.513102)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.092769)*sailStates.alpha + (0.004811)*sailStates.beta + (-0.288252)*sailStates.p + (1.309319)*sailStates.q + (0.000582)*sailStates.r + (0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end