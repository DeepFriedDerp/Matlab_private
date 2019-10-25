function [aeroForces] = paramSpace_2_1_3_3_3_1_1(sailStates,airStates)

	CL = (4.287951)*sailStates.alpha + (-0.125794)*sailStates.beta + (-2.301224)*sailStates.p + (32.621426)*sailStates.q + (-0.771030)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.210200;
	CY = (0.101782)*sailStates.alpha + (-0.024706)*sailStates.beta + (-0.370035)*sailStates.p + (0.499211)*sailStates.q + (0.000047)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.310614)*sailStates.alpha + (0.118816)*sailStates.beta + (-1.036890)*sailStates.p + (8.281624)*sailStates.q + (-0.685290)*sailStates.r + (0.000116)*sailStates.de;
	Cm = (-14.727602)*sailStates.alpha + (0.425499)*sailStates.beta + (7.903118)*sailStates.p + (-129.527451)*sailStates.q + (2.590687)*sailStates.r + (-0.068843)*sailStates.de;
	Cn = (-0.346355)*sailStates.alpha + (-0.000273)*sailStates.beta + (0.828981)*sailStates.p + (-4.255865)*sailStates.q + (-0.000259)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end