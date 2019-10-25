function [aeroForces] = paramSpace_3_1_3_2_2_2_3(sailStates,airStates)

	CL = (3.912594)*sailStates.alpha + (0.087191)*sailStates.beta + (-2.949188)*sailStates.p + (37.969780)*sailStates.q + (0.388433)*sailStates.r + (0.011058)*sailStates.de;
	CD = 0.033750;
	CY = (0.003963)*sailStates.alpha + (-0.024904)*sailStates.beta + (0.098836)*sailStates.p + (-0.100923)*sailStates.q + (-0.006482)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.423927)*sailStates.alpha + (-0.017290)*sailStates.beta + (-1.576182)*sailStates.p + (13.365644)*sailStates.q + (0.285360)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.154802)*sailStates.alpha + (-0.344011)*sailStates.beta + (10.030891)*sailStates.p + (-147.195892)*sailStates.q + (-1.325629)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.110381)*sailStates.alpha + (0.002462)*sailStates.beta + (-0.120798)*sailStates.p + (0.223452)*sailStates.q + (-0.004040)*sailStates.r + (0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end