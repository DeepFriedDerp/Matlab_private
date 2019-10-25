function [aeroForces] = paramSpace_4_4_4_2_2_3_1(sailStates,airStates)

	CL = (4.367172)*sailStates.alpha + (-0.450873)*sailStates.beta + (-2.150132)*sailStates.p + (35.385113)*sailStates.q + (1.857561)*sailStates.r + (0.010868)*sailStates.de;
	CD = -0.477960;
	CY = (-0.073684)*sailStates.alpha + (-0.025838)*sailStates.beta + (0.662226)*sailStates.p + (0.301044)*sailStates.q + (-0.131693)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.084262)*sailStates.alpha + (-0.453476)*sailStates.beta + (-0.812993)*sailStates.p + (7.129111)*sailStates.q + (1.518008)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-11.550352)*sailStates.alpha + (1.766403)*sailStates.beta + (6.176060)*sailStates.p + (-122.964470)*sailStates.q + (-6.199623)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.562660)*sailStates.alpha + (0.065157)*sailStates.beta + (-1.377602)*sailStates.p + (5.513196)*sailStates.q + (0.003881)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end