function [aeroForces] = paramSpace_1_2_3_2_1_2_2(sailStates,airStates)

	CL = (3.922530)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.523617)*sailStates.p + (35.073006)*sailStates.q + (-0.673695)*sailStates.r + (0.010859)*sailStates.de;
	CD = 0.056870;
	CY = (-0.094599)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.057665)*sailStates.p + (-0.759371)*sailStates.q + (-0.010240)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.184514)*sailStates.alpha + (0.059130)*sailStates.beta + (-1.187571)*sailStates.p + (9.850219)*sailStates.q + (-0.412774)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-14.250403)*sailStates.alpha + (0.000000)*sailStates.beta + (8.559495)*sailStates.p + (-136.489655)*sailStates.q + (2.262594)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.231810)*sailStates.alpha + (0.010426)*sailStates.beta + (-0.009387)*sailStates.p + (1.128317)*sailStates.q + (-0.037639)*sailStates.r + (0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end