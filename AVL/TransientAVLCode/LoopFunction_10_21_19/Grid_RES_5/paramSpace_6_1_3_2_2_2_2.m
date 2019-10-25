function [aeroForces] = paramSpace_6_1_3_2_2_2_2(sailStates,airStates)

	CL = (4.115849)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.762306)*sailStates.p + (36.072262)*sailStates.q + (0.048757)*sailStates.r + (0.011037)*sailStates.de;
	CD = -0.063150;
	CY = (0.067149)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.105058)*sailStates.p + (0.466417)*sailStates.q + (0.007363)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.331823)*sailStates.alpha + (-0.071376)*sailStates.beta + (-1.375763)*sailStates.p + (11.246958)*sailStates.q + (0.158600)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.839825)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.547423)*sailStates.p + (-142.955811)*sailStates.q + (-0.182521)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (0.026516)*sailStates.alpha + (-0.004991)*sailStates.beta + (-0.329398)*sailStates.p + (1.411207)*sailStates.q + (-0.005281)*sailStates.r + (-0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end