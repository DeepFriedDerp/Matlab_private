function [aeroForces] = paramSpace_4_2_3_3_1_1_1(sailStates,airStates)

	CL = (3.883561)*sailStates.alpha + (0.022068)*sailStates.beta + (-2.164797)*sailStates.p + (30.920765)*sailStates.q + (0.353545)*sailStates.r + (0.010010)*sailStates.de;
	CD = -0.036410;
	CY = (-0.032827)*sailStates.alpha + (-0.025300)*sailStates.beta + (-0.027327)*sailStates.p + (-0.294836)*sailStates.q + (0.005425)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.082106)*sailStates.alpha + (0.032068)*sailStates.beta + (-0.948136)*sailStates.p + (7.535252)*sailStates.q + (0.099137)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-14.348328)*sailStates.alpha + (-0.077189)*sailStates.beta + (7.622124)*sailStates.p + (-127.124184)*sailStates.q + (-1.232696)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.177710)*sailStates.alpha + (-0.006255)*sailStates.beta + (0.232897)*sailStates.p + (-1.381673)*sailStates.q + (-0.028533)*sailStates.r + (0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end