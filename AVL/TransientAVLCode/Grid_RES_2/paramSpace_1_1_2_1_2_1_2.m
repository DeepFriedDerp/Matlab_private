function [aeroForces] = paramSpace_1_1_2_1_2_1_2(sailStates,airStates)

	CL = (7.358558)*sailStates.alpha + (0.434413)*sailStates.beta + (-2.551394)*sailStates.p + (29.899059)*sailStates.q + (0.122630)*sailStates.r + (0.008771)*sailStates.de;
	CD = -4.131610;
	CY = (1.829302)*sailStates.alpha + (-0.053499)*sailStates.beta + (-0.329331)*sailStates.p + (14.959482)*sailStates.q + (-0.042298)*sailStates.r + (0.003184)*sailStates.de;

	Cl = (-1.072883)*sailStates.alpha + (-0.428903)*sailStates.beta + (-1.439674)*sailStates.p + (12.309672)*sailStates.q + (0.737671)*sailStates.r + (0.000557)*sailStates.de;
	Cm = (-13.746626)*sailStates.alpha + (-2.063260)*sailStates.beta + (9.089522)*sailStates.p + (-137.260315)*sailStates.q + (-0.615696)*sailStates.r + (-0.068318)*sailStates.de;
	Cn = (-1.938384)*sailStates.alpha + (-0.034924)*sailStates.beta + (0.115419)*sailStates.p + (-11.019161)*sailStates.q + (0.135425)*sailStates.r + (-0.004233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end