function [aeroForces] = paramSpace_4_2_2_2_2_1_1(sailStates,airStates)

	CL = (4.134212)*sailStates.alpha + (-0.021097)*sailStates.beta + (-2.015808)*sailStates.p + (28.352991)*sailStates.q + (-0.196166)*sailStates.r + (0.009786)*sailStates.de;
	CD = -0.338670;
	CY = (0.087140)*sailStates.alpha + (-0.024666)*sailStates.beta + (-0.302024)*sailStates.p + (0.301044)*sailStates.q + (0.060066)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.060402)*sailStates.alpha + (0.133209)*sailStates.beta + (-0.836564)*sailStates.p + (6.090294)*sailStates.q + (-0.407209)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-15.132087)*sailStates.alpha + (0.101678)*sailStates.beta + (7.593554)*sailStates.p + (-123.990753)*sailStates.q + (0.588738)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.517889)*sailStates.alpha + (-0.030023)*sailStates.beta + (0.808465)*sailStates.p + (-4.224555)*sailStates.q + (-0.046749)*sailStates.r + (-0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end