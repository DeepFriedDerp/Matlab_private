function [aeroForces] = paramSpace_1_1_2_2_2_2_1(sailStates,airStates)

	CL = (7.239954)*sailStates.alpha + (0.429842)*sailStates.beta + (-2.552783)*sailStates.p + (29.959766)*sailStates.q + (0.136284)*sailStates.r + (0.008800)*sailStates.de;
	CD = -4.020520;
	CY = (1.790958)*sailStates.alpha + (-0.052896)*sailStates.beta + (-0.311043)*sailStates.p + (14.645218)*sailStates.q + (-0.039912)*sailStates.r + (0.003118)*sailStates.de;

	Cl = (-1.016706)*sailStates.alpha + (-0.424507)*sailStates.beta + (-1.437817)*sailStates.p + (12.277826)*sailStates.q + (0.740969)*sailStates.r + (0.000560)*sailStates.de;
	Cm = (-13.715466)*sailStates.alpha + (-2.039541)*sailStates.beta + (9.102617)*sailStates.p + (-137.322174)*sailStates.q + (-0.657211)*sailStates.r + (-0.068324)*sailStates.de;
	Cn = (-1.892358)*sailStates.alpha + (-0.035062)*sailStates.beta + (0.084254)*sailStates.p + (-10.646945)*sailStates.q + (0.131759)*sailStates.r + (-0.004142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end