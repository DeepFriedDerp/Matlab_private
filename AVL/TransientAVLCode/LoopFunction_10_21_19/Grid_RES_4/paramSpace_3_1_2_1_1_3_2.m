function [aeroForces] = paramSpace_3_1_2_1_1_3_2(sailStates,airStates)

	CL = (7.595754)*sailStates.alpha + (0.637699)*sailStates.beta + (-2.588184)*sailStates.p + (37.447357)*sailStates.q + (2.991036)*sailStates.r + (0.011417)*sailStates.de;
	CD = -2.964810;
	CY = (-0.226148)*sailStates.alpha + (-0.026414)*sailStates.beta + (1.391395)*sailStates.p + (-1.693498)*sailStates.q + (-0.091137)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (2.941889)*sailStates.alpha + (-0.426387)*sailStates.beta + (-1.255486)*sailStates.p + (11.047688)*sailStates.q + (2.658630)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-15.133358)*sailStates.alpha + (-2.424570)*sailStates.beta + (8.003542)*sailStates.p + (-135.354233)*sailStates.q + (-10.105371)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.515711)*sailStates.alpha + (0.045899)*sailStates.beta + (-3.006745)*sailStates.p + (14.699438)*sailStates.q + (0.028123)*sailStates.r + (0.000737)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end