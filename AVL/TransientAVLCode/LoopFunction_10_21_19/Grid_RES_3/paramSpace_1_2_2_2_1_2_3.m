function [aeroForces] = paramSpace_1_2_2_2_1_2_3(sailStates,airStates)

	CL = (3.781481)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.913616)*sailStates.p + (38.423370)*sailStates.q + (-0.824365)*sailStates.r + (0.010953)*sailStates.de;
	CD = 0.075250;
	CY = (-0.082181)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.119907)*sailStates.p + (-0.491414)*sailStates.q + (-0.021143)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.282697)*sailStates.alpha + (0.079556)*sailStates.beta + (-1.507628)*sailStates.p + (12.912399)*sailStates.q + (-0.558135)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-13.658187)*sailStates.alpha + (0.000000)*sailStates.beta + (9.820415)*sailStates.p + (-147.390610)*sailStates.q + (2.792014)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.310121)*sailStates.alpha + (0.014028)*sailStates.beta + (0.052148)*sailStates.p + (1.042794)*sailStates.q + (-0.042345)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end