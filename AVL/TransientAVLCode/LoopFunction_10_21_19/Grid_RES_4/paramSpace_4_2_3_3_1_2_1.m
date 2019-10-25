function [aeroForces] = paramSpace_4_2_3_3_1_2_1(sailStates,airStates)

	CL = (3.894706)*sailStates.alpha + (0.073400)*sailStates.beta + (-2.214706)*sailStates.p + (33.250031)*sailStates.q + (1.014901)*sailStates.r + (0.010469)*sailStates.de;
	CD = 0.052290;
	CY = (-0.068679)*sailStates.alpha + (-0.025300)*sailStates.beta + (0.275727)*sailStates.p + (-0.294836)*sailStates.q + (-0.054856)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.144933)*sailStates.alpha + (-0.104910)*sailStates.beta + (-0.963927)*sailStates.p + (8.150228)*sailStates.q + (0.712430)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-13.525557)*sailStates.alpha + (-0.273245)*sailStates.beta + (7.189710)*sailStates.p + (-127.124184)*sailStates.q + (-3.406590)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.075504)*sailStates.alpha + (0.024855)*sailStates.beta + (-0.456644)*sailStates.p + (1.710016)*sailStates.q + (-0.012752)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end