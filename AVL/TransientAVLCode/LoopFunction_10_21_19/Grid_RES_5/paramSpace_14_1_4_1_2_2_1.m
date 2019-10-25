function [aeroForces] = paramSpace_14_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.361264)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.113878)*sailStates.p + (35.948860)*sailStates.q + (1.909245)*sailStates.r + (0.011187)*sailStates.de;
	CD = -0.593410;
	CY = (0.046440)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.634619)*sailStates.p + (1.364606)*sailStates.q + (-0.134745)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (0.882949)*sailStates.alpha + (-0.371360)*sailStates.beta + (-0.807061)*sailStates.p + (7.283486)*sailStates.q + (1.588471)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-10.692596)*sailStates.alpha + (0.000000)*sailStates.beta + (5.950233)*sailStates.p + (-122.335159)*sailStates.q + (-6.366441)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (0.499027)*sailStates.alpha + (0.078935)*sailStates.beta + (-1.344574)*sailStates.p + (4.507276)*sailStates.q + (-0.015923)*sailStates.r + (-0.000298)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end