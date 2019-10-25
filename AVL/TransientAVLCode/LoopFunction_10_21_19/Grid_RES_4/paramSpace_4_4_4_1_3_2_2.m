function [aeroForces] = paramSpace_4_4_4_1_3_2_2(sailStates,airStates)

	CL = (3.700747)*sailStates.alpha + (-0.175452)*sailStates.beta + (-2.509322)*sailStates.p + (34.811878)*sailStates.q + (0.565497)*sailStates.r + (0.010353)*sailStates.de;
	CD = 0.082140;
	CY = (0.200637)*sailStates.alpha + (-0.030602)*sailStates.beta + (-0.022909)*sailStates.p + (1.664521)*sailStates.q + (0.004736)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (1.062668)*sailStates.alpha + (-0.088549)*sailStates.beta + (-1.137109)*sailStates.p + (9.154049)*sailStates.q + (0.347961)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-13.421597)*sailStates.alpha + (0.737764)*sailStates.beta + (8.664579)*sailStates.p + (-136.195908)*sailStates.q + (-1.986804)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.365901)*sailStates.alpha + (0.021737)*sailStates.beta + (0.209927)*sailStates.p + (-2.976840)*sailStates.q + (-0.066518)*sailStates.r + (-0.000499)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end