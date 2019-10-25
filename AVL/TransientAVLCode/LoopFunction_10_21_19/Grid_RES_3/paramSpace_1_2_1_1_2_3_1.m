function [aeroForces] = paramSpace_1_2_1_1_2_3_1(sailStates,airStates)

	CL = (5.462067)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.490497)*sailStates.p + (20.997196)*sailStates.q + (1.661113)*sailStates.r + (0.008874)*sailStates.de;
	CD = -2.041330;
	CY = (-0.406232)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.912819)*sailStates.p + (-0.589407)*sailStates.q + (0.161011)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.039349)*sailStates.alpha + (-0.432903)*sailStates.beta + (-0.421350)*sailStates.p + (1.296858)*sailStates.q + (1.701668)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-16.000793)*sailStates.alpha + (0.000000)*sailStates.beta + (6.818221)*sailStates.p + (-111.551048)*sailStates.q + (-5.433043)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (1.975573)*sailStates.alpha + (-0.076333)*sailStates.beta + (-2.118967)*sailStates.p + (10.102242)*sailStates.q + (-0.060681)*sailStates.r + (0.000328)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end