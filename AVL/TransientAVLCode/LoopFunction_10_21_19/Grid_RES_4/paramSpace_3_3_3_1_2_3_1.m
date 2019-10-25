function [aeroForces] = paramSpace_3_3_3_1_2_3_1(sailStates,airStates)

	CL = (6.198291)*sailStates.alpha + (-0.194670)*sailStates.beta + (-1.739857)*sailStates.p + (30.468557)*sailStates.q + (2.443185)*sailStates.r + (0.011161)*sailStates.de;
	CD = -2.330720;
	CY = (-0.373663)*sailStates.alpha + (-0.025063)*sailStates.beta + (1.097076)*sailStates.p + (0.221991)*sailStates.q + (-0.071898)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.232103)*sailStates.alpha + (-0.608829)*sailStates.beta + (-0.487302)*sailStates.p + (3.580725)*sailStates.q + (2.223402)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-12.500922)*sailStates.alpha + (0.768202)*sailStates.beta + (5.308177)*sailStates.p + (-112.898659)*sailStates.q + (-8.294331)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (2.058095)*sailStates.alpha + (0.035395)*sailStates.beta + (-2.445157)*sailStates.p + (10.903929)*sailStates.q + (0.016556)*sailStates.r + (0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end