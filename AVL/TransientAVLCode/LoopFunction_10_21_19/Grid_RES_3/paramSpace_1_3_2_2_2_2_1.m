function [aeroForces] = paramSpace_1_3_2_2_2_2_1(sailStates,airStates)

	CL = (3.820689)*sailStates.alpha + (0.145366)*sailStates.beta + (-2.094913)*sailStates.p + (31.711718)*sailStates.q + (-0.735551)*sailStates.r + (0.010422)*sailStates.de;
	CD = 0.052930;
	CY = (-0.007110)*sailStates.alpha + (-0.025506)*sailStates.beta + (-0.154220)*sailStates.p + (-0.267956)*sailStates.q + (-0.027193)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (0.906112)*sailStates.alpha + (0.124468)*sailStates.beta + (-0.803933)*sailStates.p + (6.231260)*sailStates.q + (-0.479140)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-13.607532)*sailStates.alpha + (-0.528259)*sailStates.beta + (6.987536)*sailStates.p + (-123.711845)*sailStates.q + (2.481509)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.034269)*sailStates.alpha + (0.016906)*sailStates.beta + (0.247074)*sailStates.p + (-0.628029)*sailStates.q + (-0.015924)*sailStates.r + (0.000061)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end