function [aeroForces] = paramSpace_4_4_4_3_3_2_2(sailStates,airStates)

	CL = (3.707742)*sailStates.alpha + (-0.217267)*sailStates.beta + (-2.474676)*sailStates.p + (35.005333)*sailStates.q + (0.866140)*sailStates.r + (0.010347)*sailStates.de;
	CD = 0.101090;
	CY = (0.061021)*sailStates.alpha + (-0.026497)*sailStates.beta + (0.163743)*sailStates.p + (0.489619)*sailStates.q + (-0.032518)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.075020)*sailStates.alpha + (-0.154421)*sailStates.beta + (-1.115532)*sailStates.p + (9.215274)*sailStates.q + (0.594804)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-13.201666)*sailStates.alpha + (0.875347)*sailStates.beta + (8.262428)*sailStates.p + (-134.519470)*sailStates.q + (-2.957214)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.171082)*sailStates.alpha + (0.025185)*sailStates.beta + (-0.183879)*sailStates.p + (-0.303561)*sailStates.q + (-0.037949)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end