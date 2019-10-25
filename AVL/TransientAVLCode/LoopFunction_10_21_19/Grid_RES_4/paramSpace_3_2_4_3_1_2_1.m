function [aeroForces] = paramSpace_3_2_4_3_1_2_1(sailStates,airStates)

	CL = (4.035758)*sailStates.alpha + (0.038474)*sailStates.beta + (-2.301085)*sailStates.p + (32.912857)*sailStates.q + (0.441940)*sailStates.r + (0.010872)*sailStates.de;
	CD = 0.033950;
	CY = (-0.072525)*sailStates.alpha + (-0.025176)*sailStates.beta + (0.167938)*sailStates.p + (-0.432842)*sailStates.q + (-0.011053)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.171214)*sailStates.alpha + (-0.057185)*sailStates.beta + (-1.008487)*sailStates.p + (8.025698)*sailStates.q + (0.343766)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.545977)*sailStates.alpha + (-0.168165)*sailStates.beta + (7.825984)*sailStates.p + (-129.813766)*sailStates.q + (-1.522282)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.102258)*sailStates.alpha + (0.004536)*sailStates.beta + (-0.291410)*sailStates.p + (1.337589)*sailStates.q + (0.000698)*sailStates.r + (0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end