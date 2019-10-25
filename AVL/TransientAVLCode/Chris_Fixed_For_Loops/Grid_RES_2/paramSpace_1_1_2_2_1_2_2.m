function [aeroForces] = paramSpace_1_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.865997)*sailStates.alpha + (0.646371)*sailStates.beta + (-5.655320)*sailStates.p + (53.249157)*sailStates.q + (2.079353)*sailStates.r + (0.010885)*sailStates.de;
	CD = -6.071650;
	CY = (2.116057)*sailStates.alpha + (-0.031425)*sailStates.beta + (1.212657)*sailStates.p + (3.459080)*sailStates.q + (0.159894)*sailStates.r + (0.000780)*sailStates.de;

	Cl = (-0.506499)*sailStates.alpha + (-0.625859)*sailStates.beta + (-3.912018)*sailStates.p + (33.921234)*sailStates.q + (2.263431)*sailStates.r + (0.005101)*sailStates.de;
	Cm = (2.142992)*sailStates.alpha + (-2.701052)*sailStates.beta + (21.039679)*sailStates.p + (-227.267090)*sailStates.q + (-7.019763)*sailStates.r + (-0.080391)*sailStates.de;
	Cn = (-7.890748)*sailStates.alpha + (-0.108691)*sailStates.beta + (-3.332271)*sailStates.p + (14.649299)*sailStates.q + (-0.073542)*sailStates.r + (-0.000594)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end