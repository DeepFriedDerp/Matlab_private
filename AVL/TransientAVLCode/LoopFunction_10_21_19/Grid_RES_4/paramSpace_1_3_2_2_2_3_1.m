function [aeroForces] = paramSpace_1_3_2_2_2_3_1(sailStates,airStates)

	CL = (4.082753)*sailStates.alpha + (-0.014351)*sailStates.beta + (-2.015226)*sailStates.p + (28.401257)*sailStates.q + (0.188374)*sailStates.r + (0.009699)*sailStates.de;
	CD = -0.314280;
	CY = (-0.084656)*sailStates.alpha + (-0.025307)*sailStates.beta + (0.287660)*sailStates.p + (-0.301044)*sailStates.q + (0.057230)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.003438)*sailStates.alpha + (-0.137836)*sailStates.beta + (-0.804710)*sailStates.p + (5.695573)*sailStates.q + (0.390332)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-14.930257)*sailStates.alpha + (0.057704)*sailStates.beta + (7.584595)*sailStates.p + (-123.990753)*sailStates.q + (-0.543697)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.512420)*sailStates.alpha + (-0.023856)*sailStates.beta + (-0.780556)*sailStates.p + (4.134316)*sailStates.q + (-0.045809)*sailStates.r + (0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end