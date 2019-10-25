function [aeroForces] = paramSpace_1_1_3_2_3_3_3(sailStates,airStates)

	CL = (4.071700)*sailStates.alpha + (0.031961)*sailStates.beta + (-2.788608)*sailStates.p + (35.143387)*sailStates.q + (-0.177407)*sailStates.r + (0.010265)*sailStates.de;
	CD = -0.251200;
	CY = (0.145549)*sailStates.alpha + (-0.027165)*sailStates.beta + (0.129157)*sailStates.p + (1.027328)*sailStates.q + (0.022872)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.370811)*sailStates.alpha + (-0.118843)*sailStates.beta + (-1.495728)*sailStates.p + (12.597240)*sailStates.q + (0.097509)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.699130)*sailStates.alpha + (-0.246175)*sailStates.beta + (9.908871)*sailStates.p + (-144.553253)*sailStates.q + (0.597935)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.033298)*sailStates.alpha + (-0.022457)*sailStates.beta + (-0.545709)*sailStates.p + (2.511594)*sailStates.q + (-0.032946)*sailStates.r + (-0.000262)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end