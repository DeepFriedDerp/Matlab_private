function [aeroForces] = paramSpace_3_2_4_1_1_1_3(sailStates,airStates)

	CL = (5.065361)*sailStates.alpha + (-0.113157)*sailStates.beta + (-3.375856)*sailStates.p + (39.596367)*sailStates.q + (-1.315088)*sailStates.r + (0.010907)*sailStates.de;
	CD = -1.630700;
	CY = (-0.465500)*sailStates.alpha + (-0.025862)*sailStates.beta + (-0.641902)*sailStates.p + (-1.915494)*sailStates.q + (0.041870)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (1.349751)*sailStates.alpha + (0.371030)*sailStates.beta + (-1.917895)*sailStates.p + (16.023561)*sailStates.q + (-1.355957)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.273000)*sailStates.alpha + (0.436844)*sailStates.beta + (12.003485)*sailStates.p + (-160.694275)*sailStates.q + (4.447366)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.943187)*sailStates.alpha + (-0.026451)*sailStates.beta + (1.634771)*sailStates.p + (-6.613900)*sailStates.q + (-0.009926)*sailStates.r + (0.000362)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end