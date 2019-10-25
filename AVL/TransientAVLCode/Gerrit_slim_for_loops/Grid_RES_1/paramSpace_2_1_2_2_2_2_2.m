function [aeroForces] = paramSpace_2_1_2_2_2_2_2(sailStates,airStates)

	CL = (6.022534)*sailStates.alpha + (-2.008798)*sailStates.beta + (-3.722836)*sailStates.p + (51.045345)*sailStates.q + (2.225582)*sailStates.r + (0.012783)*sailStates.de;
	CD = -6.061620;
	CY = (2.007350)*sailStates.alpha + (-0.137249)*sailStates.beta + (0.286397)*sailStates.p + (15.850216)*sailStates.q + (-0.029847)*sailStates.r + (0.003358)*sailStates.de;

	Cl = (-5.276258)*sailStates.alpha + (-1.054208)*sailStates.beta + (-1.893550)*sailStates.p + (16.390574)*sailStates.q + (2.461955)*sailStates.r + (0.001661)*sailStates.de;
	Cm = (3.511360)*sailStates.alpha + (9.017271)*sailStates.beta + (11.675433)*sailStates.p + (-165.620453)*sailStates.q + (-7.875564)*sailStates.r + (-0.068371)*sailStates.de;
	Cn = (-2.258435)*sailStates.alpha + (0.228889)*sailStates.beta + (-0.841713)*sailStates.p + (-9.403127)*sailStates.q + (-0.199509)*sailStates.r + (-0.004393)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end