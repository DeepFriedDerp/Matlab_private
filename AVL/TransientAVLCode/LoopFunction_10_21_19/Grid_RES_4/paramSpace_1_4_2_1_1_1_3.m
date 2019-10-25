function [aeroForces] = paramSpace_1_4_2_1_1_1_3(sailStates,airStates)

	CL = (5.002580)*sailStates.alpha + (0.725673)*sailStates.beta + (-3.532089)*sailStates.p + (49.960655)*sailStates.q + (-3.152824)*sailStates.r + (0.012474)*sailStates.de;
	CD = -1.876960;
	CY = (-0.564067)*sailStates.alpha + (-0.028080)*sailStates.beta + (-1.100049)*sailStates.p + (-1.002331)*sailStates.q + (-0.218778)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.077870)*sailStates.alpha + (0.798359)*sailStates.beta + (-1.890721)*sailStates.p + (17.983103)*sailStates.q + (-2.694301)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-8.247904)*sailStates.alpha + (-2.763310)*sailStates.beta + (9.953154)*sailStates.p + (-160.076111)*sailStates.q + (10.484646)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (1.747904)*sailStates.alpha + (0.117832)*sailStates.beta + (2.197093)*sailStates.p + (-7.713888)*sailStates.q + (-0.024208)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end