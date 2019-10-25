function [aeroForces] = paramSpace_4_2_1_3_3_2_1(sailStates,airStates)

	CL = (3.877541)*sailStates.alpha + (0.047878)*sailStates.beta + (-2.244912)*sailStates.p + (32.991936)*sailStates.q + (0.747861)*sailStates.r + (0.010648)*sailStates.de;
	CD = 0.059480;
	CY = (0.075293)*sailStates.alpha + (-0.024320)*sailStates.beta + (0.091308)*sailStates.p + (0.684401)*sailStates.q + (-0.018236)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.070545)*sailStates.alpha + (-0.057368)*sailStates.beta + (-0.982579)*sailStates.p + (8.094731)*sailStates.q + (0.460034)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-14.004160)*sailStates.alpha + (-0.146634)*sailStates.beta + (7.543541)*sailStates.p + (-128.521423)*sailStates.q + (-2.504005)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.154427)*sailStates.alpha + (0.012898)*sailStates.beta + (-0.084991)*sailStates.p + (-0.540530)*sailStates.q + (-0.035904)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end