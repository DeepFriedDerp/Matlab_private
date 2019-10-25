function [aeroForces] = paramSpace_1_3_2_2_1_2_3(sailStates,airStates)

	CL = (3.729182)*sailStates.alpha + (0.155224)*sailStates.beta + (-2.896693)*sailStates.p + (38.185074)*sailStates.q + (-0.818410)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.074620;
	CY = (-0.081529)*sailStates.alpha + (-0.026069)*sailStates.beta + (-0.118566)*sailStates.p + (-0.491415)*sailStates.q + (-0.020906)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.209979)*sailStates.alpha + (0.127623)*sailStates.beta + (-1.457369)*sailStates.p + (12.315112)*sailStates.q + (-0.546586)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.470545)*sailStates.alpha + (-0.562505)*sailStates.beta + (9.764178)*sailStates.p + (-146.474228)*sailStates.q + (2.771967)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.287691)*sailStates.alpha + (0.018827)*sailStates.beta + (0.057759)*sailStates.p + (0.953384)*sailStates.q + (-0.040882)*sailStates.r + (0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end