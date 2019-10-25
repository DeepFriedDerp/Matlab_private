function [aeroForces] = paramSpace_1_3_3_2_2_3_1(sailStates,airStates)

	CL = (4.134212)*sailStates.alpha + (-0.021097)*sailStates.beta + (-2.015808)*sailStates.p + (28.352991)*sailStates.q + (0.196166)*sailStates.r + (0.009786)*sailStates.de;
	CD = -0.338670;
	CY = (-0.087140)*sailStates.alpha + (-0.025286)*sailStates.beta + (0.302024)*sailStates.p + (-0.301044)*sailStates.q + (0.060066)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.004068)*sailStates.alpha + (-0.145037)*sailStates.beta + (-0.805021)*sailStates.p + (5.693330)*sailStates.q + (0.413470)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-15.132087)*sailStates.alpha + (0.101678)*sailStates.beta + (7.593554)*sailStates.p + (-123.990753)*sailStates.q + (-0.588738)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.519294)*sailStates.alpha + (-0.025323)*sailStates.beta + (-0.802190)*sailStates.p + (4.145594)*sailStates.q + (-0.045503)*sailStates.r + (0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end