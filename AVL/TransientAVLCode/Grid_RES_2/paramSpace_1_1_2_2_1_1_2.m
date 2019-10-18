function [aeroForces] = paramSpace_1_1_2_2_1_1_2(sailStates,airStates)

	CL = (6.288896)*sailStates.alpha + (0.299477)*sailStates.beta + (-2.533518)*sailStates.p + (30.990084)*sailStates.q + (-0.173263)*sailStates.r + (0.009195)*sailStates.de;
	CD = -2.524450;
	CY = (1.506860)*sailStates.alpha + (-0.048401)*sailStates.beta + (-0.370041)*sailStates.p + (12.303662)*sailStates.q + (-0.047845)*sailStates.r + (0.002617)*sailStates.de;

	Cl = (0.088590)*sailStates.alpha + (-0.321462)*sailStates.beta + (-1.389036)*sailStates.p + (11.913962)*sailStates.q + (0.381245)*sailStates.r + (0.000515)*sailStates.de;
	Cm = (-15.086480)*sailStates.alpha + (-1.487816)*sailStates.beta + (8.842910)*sailStates.p + (-136.357986)*sailStates.q + (0.411707)*sailStates.r + (-0.068226)*sailStates.de;
	Cn = (-1.489655)*sailStates.alpha + (-0.022002)*sailStates.beta + (0.298114)*sailStates.p + (-9.916537)*sailStates.q + (0.111984)*sailStates.r + (-0.003500)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end