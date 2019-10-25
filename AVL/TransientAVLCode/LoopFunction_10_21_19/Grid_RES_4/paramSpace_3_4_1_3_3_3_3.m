function [aeroForces] = paramSpace_3_4_1_3_3_3_3(sailStates,airStates)

	CL = (4.109374)*sailStates.alpha + (-0.175308)*sailStates.beta + (-2.829808)*sailStates.p + (37.539852)*sailStates.q + (0.873802)*sailStates.r + (0.011204)*sailStates.de;
	CD = -0.127120;
	CY = (0.085926)*sailStates.alpha + (-0.025111)*sailStates.beta + (0.290989)*sailStates.p + (0.432841)*sailStates.q + (-0.019118)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.253875)*sailStates.alpha + (-0.218316)*sailStates.beta + (-1.371278)*sailStates.p + (11.276870)*sailStates.q + (0.719882)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.054916)*sailStates.alpha + (0.596501)*sailStates.beta + (9.476151)*sailStates.p + (-143.531296)*sailStates.q + (-2.934190)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.120306)*sailStates.alpha + (0.010518)*sailStates.beta + (-0.605806)*sailStates.p + (2.297302)*sailStates.q + (-0.001773)*sailStates.r + (-0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end