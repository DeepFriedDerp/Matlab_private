function [aeroForces] = paramSpace_1_1_2_2_2_1_3(sailStates,airStates)

	CL = (4.422245)*sailStates.alpha + (-0.390076)*sailStates.beta + (-2.945663)*sailStates.p + (41.502792)*sailStates.q + (-2.033309)*sailStates.r + (0.011440)*sailStates.de;
	CD = -0.495320;
	CY = (-0.085373)*sailStates.alpha + (-0.025506)*sailStates.beta + (-0.710339)*sailStates.p + (0.267955)*sailStates.q + (-0.125252)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.554896)*sailStates.alpha + (0.219756)*sailStates.beta + (-1.551365)*sailStates.p + (14.257750)*sailStates.q + (-1.669136)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-12.371273)*sailStates.alpha + (1.453040)*sailStates.beta + (8.937478)*sailStates.p + (-145.513718)*sailStates.q + (6.783701)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.485722)*sailStates.alpha + (0.061131)*sailStates.beta + (1.364247)*sailStates.p + (-5.382974)*sailStates.q + (-0.005526)*sailStates.r + (-0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end