function [aeroForces] = paramSpace_1_3_2_2_1_2_2(sailStates,airStates)

	CL = (3.826654)*sailStates.alpha + (0.138223)*sailStates.beta + (-2.505816)*sailStates.p + (34.892727)*sailStates.q + (-0.679320)*sailStates.r + (0.010609)*sailStates.de;
	CD = 0.065220;
	CY = (-0.093942)*sailStates.alpha + (-0.026744)*sailStates.beta + (-0.075811)*sailStates.p + (-0.759371)*sailStates.q + (-0.013367)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.099601)*sailStates.alpha + (0.105336)*sailStates.beta + (-1.136883)*sailStates.p + (9.255573)*sailStates.q + (-0.432790)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-13.815586)*sailStates.alpha + (-0.505267)*sailStates.beta + (8.491587)*sailStates.p + (-135.573257)*sailStates.q + (2.308781)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.211455)*sailStates.alpha + (0.016535)*sailStates.beta + (0.025417)*sailStates.p + (1.023862)*sailStates.q + (-0.036484)*sailStates.r + (0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end