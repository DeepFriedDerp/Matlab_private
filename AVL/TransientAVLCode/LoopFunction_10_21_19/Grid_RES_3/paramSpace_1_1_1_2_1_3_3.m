function [aeroForces] = paramSpace_1_1_1_2_1_3_3(sailStates,airStates)

	CL = (4.165295)*sailStates.alpha + (0.031190)*sailStates.beta + (-2.826749)*sailStates.p + (35.036705)*sailStates.q + (0.189166)*sailStates.r + (0.010063)*sailStates.de;
	CD = -0.379460;
	CY = (0.000289)*sailStates.alpha + (-0.023471)*sailStates.beta + (0.332552)*sailStates.p + (-0.491416)*sailStates.q + (0.058685)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.546262)*sailStates.alpha + (-0.140007)*sailStates.beta + (-1.519710)*sailStates.p + (12.532031)*sailStates.q + (0.354169)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-14.630711)*sailStates.alpha + (-0.088737)*sailStates.beta + (10.346915)*sailStates.p + (-146.474228)*sailStates.q + (-0.532895)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.168688)*sailStates.alpha + (-0.035316)*sailStates.beta + (-0.995302)*sailStates.p + (5.926673)*sailStates.q + (-0.066046)*sailStates.r + (0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end