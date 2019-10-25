function [aeroForces] = paramSpace_2_2_3_1_1_1_3(sailStates,airStates)

	CL = (5.215921)*sailStates.alpha + (-0.177519)*sailStates.beta + (-3.526551)*sailStates.p + (44.694080)*sailStates.q + (-2.224222)*sailStates.r + (0.012066)*sailStates.de;
	CD = -1.815510;
	CY = (-0.515910)*sailStates.alpha + (-0.024503)*sailStates.beta + (-0.880085)*sailStates.p + (-1.471501)*sailStates.q + (-0.057736)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (1.291385)*sailStates.alpha + (0.449623)*sailStates.beta + (-1.976095)*sailStates.p + (17.367083)*sailStates.q + (-2.029876)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-11.436833)*sailStates.alpha + (0.688483)*sailStates.beta + (11.412743)*sailStates.p + (-162.286758)*sailStates.q + (7.544527)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.396793)*sailStates.alpha + (0.032935)*sailStates.beta + (1.911127)*sailStates.p + (-7.181605)*sailStates.q + (0.000781)*sailStates.r + (0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end