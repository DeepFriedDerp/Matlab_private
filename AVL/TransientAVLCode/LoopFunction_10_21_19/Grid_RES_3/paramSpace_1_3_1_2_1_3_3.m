function [aeroForces] = paramSpace_1_3_1_2_1_3_3(sailStates,airStates)

	CL = (4.165295)*sailStates.alpha + (-0.031190)*sailStates.beta + (-2.826749)*sailStates.p + (35.036705)*sailStates.q + (0.189166)*sailStates.r + (0.010063)*sailStates.de;
	CD = -0.379460;
	CY = (0.000289)*sailStates.alpha + (-0.026191)*sailStates.beta + (0.332552)*sailStates.p + (-0.491416)*sailStates.q + (0.058685)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.426284)*sailStates.alpha + (-0.154300)*sailStates.beta + (-1.435093)*sailStates.p + (11.471171)*sailStates.q + (0.369190)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-14.630711)*sailStates.alpha + (0.088737)*sailStates.beta + (10.346915)*sailStates.p + (-146.474228)*sailStates.q + (-0.532895)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.182649)*sailStates.alpha + (-0.016578)*sailStates.beta + (-0.980381)*sailStates.p + (5.739615)*sailStates.q + (-0.063398)*sailStates.r + (0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end