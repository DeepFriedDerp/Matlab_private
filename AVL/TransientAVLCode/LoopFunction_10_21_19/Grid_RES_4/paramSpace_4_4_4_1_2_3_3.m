function [aeroForces] = paramSpace_4_4_4_1_2_3_3(sailStates,airStates)

	CL = (6.099268)*sailStates.alpha + (-0.806250)*sailStates.beta + (-3.482018)*sailStates.p + (50.283806)*sailStates.q + (3.588728)*sailStates.r + (0.012368)*sailStates.de;
	CD = -2.450880;
	CY = (0.424314)*sailStates.alpha + (-0.022472)*sailStates.beta + (1.379105)*sailStates.p + (-0.662188)*sailStates.q + (-0.274392)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (2.008475)*sailStates.alpha + (-0.900601)*sailStates.beta + (-1.859739)*sailStates.p + (18.072004)*sailStates.q + (3.068039)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-9.574380)*sailStates.alpha + (3.092437)*sailStates.beta + (9.371917)*sailStates.p + (-157.701080)*sailStates.q + (-11.917263)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-1.819570)*sailStates.alpha + (0.124614)*sailStates.beta + (-2.777118)*sailStates.p + (11.512092)*sailStates.q + (0.015440)*sailStates.r + (0.000442)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end