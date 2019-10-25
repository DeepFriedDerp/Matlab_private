function [aeroForces] = paramSpace_1_3_1_2_1_1_2(sailStates,airStates)

	CL = (4.218577)*sailStates.alpha + (0.373699)*sailStates.beta + (-2.573949)*sailStates.p + (38.156757)*sailStates.q + (-1.710342)*sailStates.r + (0.011139)*sailStates.de;
	CD = -0.364160;
	CY = (-0.100832)*sailStates.alpha + (-0.026932)*sailStates.beta + (-0.565775)*sailStates.p + (-0.759371)*sailStates.q + (-0.099689)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.117774)*sailStates.alpha + (0.408433)*sailStates.beta + (-1.158306)*sailStates.p + (10.104762)*sailStates.q + (-1.411493)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-12.069151)*sailStates.alpha + (-1.473363)*sailStates.beta + (7.884738)*sailStates.p + (-135.573257)*sailStates.q + (5.750388)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.034912)*sailStates.alpha + (0.056062)*sailStates.beta + (1.121905)*sailStates.p + (-3.792129)*sailStates.q + (-0.015409)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end