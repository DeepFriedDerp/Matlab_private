function [aeroForces] = paramSpace_6_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.293411)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.792182)*sailStates.p + (37.442841)*sailStates.q + (-1.025275)*sailStates.r + (0.011314)*sailStates.de;
	CD = -0.160480;
	CY = (0.023825)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.402193)*sailStates.p + (0.466417)*sailStates.q + (-0.028108)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.453438)*sailStates.alpha + (0.182250)*sailStates.beta + (-1.385213)*sailStates.p + (11.608820)*sailStates.q + (-0.846159)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.497098)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.292983)*sailStates.p + (-142.955811)*sailStates.q + (3.456140)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (0.022930)*sailStates.alpha + (0.012744)*sailStates.beta + (0.809846)*sailStates.p + (-3.763654)*sailStates.q + (0.004185)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end