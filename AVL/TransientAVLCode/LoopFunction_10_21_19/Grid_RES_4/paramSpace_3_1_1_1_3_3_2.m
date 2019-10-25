function [aeroForces] = paramSpace_3_1_1_1_3_3_2(sailStates,airStates)

	CL = (5.510972)*sailStates.alpha + (0.493201)*sailStates.beta + (-2.622529)*sailStates.p + (37.243866)*sailStates.q + (2.097453)*sailStates.r + (0.011454)*sailStates.de;
	CD = -1.770700;
	CY = (0.219627)*sailStates.alpha + (-0.023516)*sailStates.beta + (0.828920)*sailStates.p + (1.693499)*sailStates.q + (-0.054509)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (1.232074)*sailStates.alpha + (-0.341839)*sailStates.beta + (-1.276828)*sailStates.p + (10.987773)*sailStates.q + (1.912055)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-12.464546)*sailStates.alpha + (-1.869651)*sailStates.beta + (8.395697)*sailStates.p + (-136.946671)*sailStates.q + (-7.101167)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.028215)*sailStates.alpha + (0.032531)*sailStates.beta + (-1.860277)*sailStates.p + (7.082758)*sailStates.q + (0.002172)*sailStates.r + (-0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end