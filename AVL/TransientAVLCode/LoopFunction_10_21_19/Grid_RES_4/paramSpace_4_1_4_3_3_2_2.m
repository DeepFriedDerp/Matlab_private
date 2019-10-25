function [aeroForces] = paramSpace_4_1_4_3_3_2_2(sailStates,airStates)

	CL = (3.707742)*sailStates.alpha + (0.217267)*sailStates.beta + (-2.474676)*sailStates.p + (35.005333)*sailStates.q + (0.866141)*sailStates.r + (0.010347)*sailStates.de;
	CD = 0.101090;
	CY = (0.061021)*sailStates.alpha + (-0.023075)*sailStates.beta + (0.163743)*sailStates.p + (0.489619)*sailStates.q + (-0.032518)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.212543)*sailStates.alpha + (-0.042329)*sailStates.beta + (-1.209889)*sailStates.p + (10.403156)*sailStates.q + (0.613700)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-13.201666)*sailStates.alpha + (-0.875347)*sailStates.beta + (8.262428)*sailStates.p + (-134.519470)*sailStates.q + (-2.957214)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.225933)*sailStates.alpha + (0.013952)*sailStates.beta + (-0.165110)*sailStates.p + (-0.539846)*sailStates.q + (-0.041708)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end