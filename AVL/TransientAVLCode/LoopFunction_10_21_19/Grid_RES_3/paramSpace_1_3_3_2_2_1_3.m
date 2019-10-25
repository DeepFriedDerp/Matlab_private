function [aeroForces] = paramSpace_1_3_3_2_2_1_3(sailStates,airStates)

	CL = (4.447385)*sailStates.alpha + (0.364607)*sailStates.beta + (-2.946680)*sailStates.p + (41.444809)*sailStates.q + (-2.020923)*sailStates.r + (0.011546)*sailStates.de;
	CD = -0.486670;
	CY = (-0.082035)*sailStates.alpha + (-0.024222)*sailStates.beta + (-0.690873)*sailStates.p + (0.267957)*sailStates.q + (-0.121794)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.454159)*sailStates.alpha + (0.450931)*sailStates.beta + (-1.467190)*sailStates.p + (13.194265)*sailStates.q + (-1.622468)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-12.608995)*sailStates.alpha + (-1.294089)*sailStates.beta + (8.949908)*sailStates.p + (-145.513718)*sailStates.q + (6.713198)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.374509)*sailStates.alpha + (0.057426)*sailStates.beta + (1.349996)*sailStates.p + (-5.555206)*sailStates.q + (-0.002660)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end