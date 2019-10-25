function [aeroForces] = paramSpace_1_2_2_3_2_3_3(sailStates,airStates)

	CL = (3.889043)*sailStates.alpha + (-0.025551)*sailStates.beta + (-2.680530)*sailStates.p + (35.114136)*sailStates.q + (-0.430351)*sailStates.r + (0.010254)*sailStates.de;
	CD = -0.046340;
	CY = (0.028466)*sailStates.alpha + (-0.025190)*sailStates.beta + (0.043154)*sailStates.p + (0.194782)*sailStates.q + (0.008577)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.318497)*sailStates.alpha + (-0.039746)*sailStates.beta + (-1.368646)*sailStates.p + (11.473126)*sailStates.q + (-0.161629)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-14.311790)*sailStates.alpha + (0.089374)*sailStates.beta + (9.408355)*sailStates.p + (-141.871536)*sailStates.q + (1.501183)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.205220)*sailStates.alpha + (-0.008047)*sailStates.beta + (-0.349611)*sailStates.p + (2.393718)*sailStates.q + (-0.047548)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end