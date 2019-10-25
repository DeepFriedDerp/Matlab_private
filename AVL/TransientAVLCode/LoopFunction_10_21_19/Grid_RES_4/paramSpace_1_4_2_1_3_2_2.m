function [aeroForces] = paramSpace_1_4_2_1_3_2_2(sailStates,airStates)

	CL = (4.112755)*sailStates.alpha + (0.273751)*sailStates.beta + (-2.411817)*sailStates.p + (35.311825)*sailStates.q + (-1.409153)*sailStates.r + (0.010422)*sailStates.de;
	CD = -0.029450;
	CY = (0.219923)*sailStates.alpha + (-0.019316)*sailStates.beta + (-0.491654)*sailStates.p + (1.664522)*sailStates.q + (-0.097856)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.387783)*sailStates.alpha + (0.267585)*sailStates.beta + (-1.076303)*sailStates.p + (9.325309)*sailStates.q + (-1.024193)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-13.639095)*sailStates.alpha + (-0.996192)*sailStates.beta + (7.534586)*sailStates.p + (-131.445847)*sailStates.q + (4.688753)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.213423)*sailStates.alpha + (0.030539)*sailStates.beta + (0.884299)*sailStates.p + (-4.586675)*sailStates.q + (0.014821)*sailStates.r + (-0.000528)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end