function [aeroForces] = paramSpace_1_2_3_2_2_3_2(sailStates,airStates)

	CL = (4.287897)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.434563)*sailStates.p + (31.977974)*sailStates.q + (0.150369)*sailStates.r + (0.010217)*sailStates.de;
	CD = -0.352750;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.291756)*sailStates.p + (0.000000)*sailStates.q + (0.051444)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.279958)*sailStates.alpha + (-0.145878)*sailStates.beta + (-1.153281)*sailStates.p + (9.038880)*sailStates.q + (0.374544)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-15.422602)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.923209)*sailStates.p + (-135.529190)*sailStates.q + (-0.476854)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.298654)*sailStates.alpha + (-0.025722)*sailStates.beta + (-0.822758)*sailStates.p + (4.207007)*sailStates.q + (-0.043447)*sailStates.r + (0.000054)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end