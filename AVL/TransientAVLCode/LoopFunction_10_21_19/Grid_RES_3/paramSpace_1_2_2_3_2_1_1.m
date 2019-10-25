function [aeroForces] = paramSpace_1_2_2_3_2_1_1(sailStates,airStates)

	CL = (4.208090)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.294418)*sailStates.p + (35.185394)*sailStates.q + (-1.449861)*sailStates.r + (0.011040)*sailStates.de;
	CD = -0.188550;
	CY = (0.029766)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.474949)*sailStates.p + (-0.173374)*sailStates.q + (-0.083746)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.175659)*sailStates.alpha + (0.244391)*sailStates.beta + (-0.981430)*sailStates.p + (8.455879)*sailStates.q + (-1.143499)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-13.061724)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.108078)*sailStates.p + (-128.476028)*sailStates.q + (4.847860)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (-0.215593)*sailStates.alpha + (0.043093)*sailStates.beta + (0.943070)*sailStates.p + (-3.667862)*sailStates.q + (-0.004827)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end