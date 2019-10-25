function [aeroForces] = paramSpace_2_4_2_1_2_2_1(sailStates,airStates)

	CL = (3.685072)*sailStates.alpha + (0.063701)*sailStates.beta + (-1.662347)*sailStates.p + (27.543161)*sailStates.q + (-0.218513)*sailStates.r + (0.010469)*sailStates.de;
	CD = 0.031090;
	CY = (-0.010443)*sailStates.alpha + (-0.025046)*sailStates.beta + (-0.046457)*sailStates.p + (-0.221995)*sailStates.q + (-0.003037)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (0.492593)*sailStates.alpha + (0.041437)*sailStates.beta + (-0.427244)*sailStates.p + (2.401813)*sailStates.q + (-0.140403)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-13.478028)*sailStates.alpha + (-0.263670)*sailStates.beta + (5.735211)*sailStates.p + (-111.854546)*sailStates.q + (0.753672)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-0.058638)*sailStates.alpha + (0.002260)*sailStates.beta + (0.088773)*sailStates.p + (-0.216754)*sailStates.q + (-0.001588)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end