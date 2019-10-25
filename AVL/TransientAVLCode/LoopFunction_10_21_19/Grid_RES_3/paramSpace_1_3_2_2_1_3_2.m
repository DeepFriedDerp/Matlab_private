function [aeroForces] = paramSpace_1_3_2_2_1_3_2(sailStates,airStates)

	CL = (4.333569)*sailStates.alpha + (-0.072485)*sailStates.beta + (-2.436821)*sailStates.p + (31.686331)*sailStates.q + (0.340257)*sailStates.r + (0.009975)*sailStates.de;
	CD = -0.438120;
	CY = (-0.087046)*sailStates.alpha + (-0.026744)*sailStates.beta + (0.394798)*sailStates.p + (-0.759371)*sailStates.q + (0.069614)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.323536)*sailStates.alpha + (-0.187497)*sailStates.beta + (-1.115057)*sailStates.p + (8.409019)*sailStates.q + (0.514691)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-15.318514)*sailStates.alpha + (0.305037)*sailStates.beta + (9.086835)*sailStates.p + (-135.573257)*sailStates.q + (-1.067037)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.431774)*sailStates.alpha + (-0.021033)*sailStates.beta + (-1.041996)*sailStates.p + (5.824912)*sailStates.q + (-0.058310)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end