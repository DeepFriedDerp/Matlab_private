function [aeroForces] = paramSpace_3_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.869373)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.662369)*sailStates.p + (35.413189)*sailStates.q + (-0.529154)*sailStates.r + (0.010392)*sailStates.de;
	CD = 0.029500;
	CY = (0.062427)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.057094)*sailStates.p + (0.546500)*sailStates.q + (-0.010126)*sailStates.r + (0.000117)*sailStates.de;

	Cl = (1.292610)*sailStates.alpha + (0.006752)*sailStates.beta + (-1.326497)*sailStates.p + (11.087586)*sailStates.q + (-0.281795)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-14.176991)*sailStates.alpha + (0.000000)*sailStates.beta + (9.173643)*sailStates.p + (-140.819473)*sailStates.q + (1.830228)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (0.141245)*sailStates.alpha + (0.001191)*sailStates.beta + (-0.108800)*sailStates.p + (0.974763)*sailStates.q + (-0.027793)*sailStates.r + (-0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end