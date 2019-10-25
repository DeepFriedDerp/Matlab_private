function [aeroForces] = paramSpace_1_4_1_2_1_1_2(sailStates,airStates)

	CL = (4.158982)*sailStates.alpha + (0.445663)*sailStates.beta + (-2.559706)*sailStates.p + (38.563747)*sailStates.q + (-1.820831)*sailStates.r + (0.011057)*sailStates.de;
	CD = -0.357960;
	CY = (-0.101299)*sailStates.alpha + (-0.027429)*sailStates.beta + (-0.590068)*sailStates.p + (-0.756267)*sailStates.q + (-0.117291)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.094354)*sailStates.alpha + (0.438490)*sailStates.beta + (-1.144852)*sailStates.p + (10.152464)*sailStates.q + (-1.487262)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-11.579357)*sailStates.alpha + (-1.751441)*sailStates.beta + (7.684949)*sailStates.p + (-134.899979)*sailStates.q + (6.099002)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.042411)*sailStates.alpha + (0.065923)*sailStates.beta + (1.160915)*sailStates.p + (-3.871166)*sailStates.q + (-0.020054)*sailStates.r + (0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end