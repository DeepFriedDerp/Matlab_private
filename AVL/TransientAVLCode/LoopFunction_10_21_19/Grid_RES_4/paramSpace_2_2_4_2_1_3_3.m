function [aeroForces] = paramSpace_2_2_4_2_1_3_3(sailStates,airStates)

	CL = (4.623455)*sailStates.alpha + (0.073163)*sailStates.beta + (-2.950701)*sailStates.p + (36.952431)*sailStates.q + (0.837895)*sailStates.r + (0.011045)*sailStates.de;
	CD = -0.547910;
	CY = (0.007956)*sailStates.alpha + (-0.024809)*sailStates.beta + (0.531944)*sailStates.p + (-0.668511)*sailStates.q + (0.034795)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.673078)*sailStates.alpha + (-0.220649)*sailStates.beta + (-1.549615)*sailStates.p + (12.703990)*sailStates.q + (0.872017)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-15.257577)*sailStates.alpha + (-0.317004)*sailStates.beta + (10.417214)*sailStates.p + (-148.601746)*sailStates.q + (-2.866425)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.012178)*sailStates.alpha + (-0.016528)*sailStates.beta + (-1.246929)*sailStates.p + (6.363708)*sailStates.q + (-0.018143)*sailStates.r + (0.000281)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end