function [aeroForces] = paramSpace_2_2_4_2_1_1_3(sailStates,airStates)

	CL = (4.306943)*sailStates.alpha + (-0.083984)*sailStates.beta + (-3.003370)*sailStates.p + (39.367764)*sailStates.q + (-1.180272)*sailStates.r + (0.011535)*sailStates.de;
	CD = -0.345400;
	CY = (-0.155837)*sailStates.alpha + (-0.024809)*sailStates.beta + (-0.421748)*sailStates.p + (-0.668513)*sailStates.q + (-0.027713)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.382912)*sailStates.alpha + (0.211737)*sailStates.beta + (-1.566274)*sailStates.p + (13.341685)*sailStates.q + (-1.016344)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-13.837450)*sailStates.alpha + (0.299971)*sailStates.beta + (9.968823)*sailStates.p + (-148.601746)*sailStates.q + (3.974689)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.315172)*sailStates.alpha + (0.015663)*sailStates.beta + (0.894496)*sailStates.p + (-3.365640)*sailStates.q + (-0.001397)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end