function [aeroForces] = paramSpace_3_1_3_3_2_3_2(sailStates,airStates)

	CL = (4.231298)*sailStates.alpha + (0.232024)*sailStates.beta + (-2.564029)*sailStates.p + (35.491982)*sailStates.q + (0.987848)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.189810;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.390795)*sailStates.p + (0.000000)*sailStates.q + (-0.025614)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.377424)*sailStates.alpha + (-0.128714)*sailStates.beta + (-1.253016)*sailStates.p + (10.522942)*sailStates.q + (0.852577)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.137229)*sailStates.alpha + (-0.915790)*sailStates.beta + (8.543376)*sailStates.p + (-136.150452)*sailStates.q + (-3.358610)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.041341)*sailStates.alpha + (0.013318)*sailStates.beta + (-0.801115)*sailStates.p + (3.342111)*sailStates.q + (0.001971)*sailStates.r + (0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end