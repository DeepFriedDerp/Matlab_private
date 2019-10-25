function [aeroForces] = paramSpace_1_3_3_1_1_2_1(sailStates,airStates)

	CL = (3.689160)*sailStates.alpha + (0.047401)*sailStates.beta + (-1.670670)*sailStates.p + (27.460272)*sailStates.q + (-0.129031)*sailStates.r + (0.010325)*sailStates.de;
	CD = 0.009350;
	CY = (-0.338238)*sailStates.alpha + (-0.029968)*sailStates.beta + (0.182835)*sailStates.p + (-2.260755)*sailStates.q + (0.032024)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.543043)*sailStates.alpha + (-0.002208)*sailStates.beta + (-0.447216)*sailStates.p + (2.480735)*sailStates.q + (0.040148)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-13.739202)*sailStates.alpha + (-0.127875)*sailStates.beta + (5.979996)*sailStates.p + (-112.748650)*sailStates.q + (0.471257)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (0.504376)*sailStates.alpha + (0.006001)*sailStates.beta + (-0.379342)*sailStates.p + (3.262588)*sailStates.q + (-0.045805)*sailStates.r + (0.000659)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end