function [aeroForces] = paramSpace_1_1_2_1_1_2_2(sailStates,airStates)

	CL = (4.267282)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.824343)*sailStates.p + (33.893143)*sailStates.q + (0.083188)*sailStates.r + (0.009492)*sailStates.de;
	CD = -0.617730;
	CY = (0.033545)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.384305)*sailStates.p + (-0.476205)*sailStates.q + (0.095835)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.546948)*sailStates.alpha + (-0.173439)*sailStates.beta + (-1.515748)*sailStates.p + (12.328147)*sailStates.q + (0.356714)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-14.899786)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.791447)*sailStates.p + (-148.858078)*sailStates.q + (-0.079518)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (0.174147)*sailStates.alpha + (-0.043243)*sailStates.beta + (-1.215322)*sailStates.p + (7.222013)*sailStates.q + (-0.119884)*sailStates.r + (0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end