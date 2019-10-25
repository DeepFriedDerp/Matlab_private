function [aeroForces] = paramSpace_1_1_4_1_2_1_2(sailStates,airStates)

	CL = (6.488231)*sailStates.alpha + (-0.694721)*sailStates.beta + (-2.632416)*sailStates.p + (42.873310)*sailStates.q + (-3.217846)*sailStates.r + (0.012163)*sailStates.de;
	CD = -2.362550;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.230486)*sailStates.p + (0.000001)*sailStates.q + (-0.244759)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.990524)*sailStates.alpha + (0.399269)*sailStates.beta + (-1.255737)*sailStates.p + (12.516282)*sailStates.q + (-2.735029)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-10.762108)*sailStates.alpha + (2.535625)*sailStates.beta + (6.651245)*sailStates.p + (-133.820877)*sailStates.q + (10.619067)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.043589)*sailStates.alpha + (0.127801)*sailStates.beta + (2.612459)*sailStates.p + (-11.069341)*sailStates.q + (0.025112)*sailStates.r + (-0.000234)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end