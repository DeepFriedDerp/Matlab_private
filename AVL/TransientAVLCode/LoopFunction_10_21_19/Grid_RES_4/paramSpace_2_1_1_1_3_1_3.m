function [aeroForces] = paramSpace_2_1_1_1_3_1_3(sailStates,airStates)

	CL = (7.311779)*sailStates.alpha + (-0.697537)*sailStates.beta + (-3.472269)*sailStates.p + (44.648438)*sailStates.q + (-3.126631)*sailStates.r + (0.011819)*sailStates.de;
	CD = -3.031980;
	CY = (-0.279046)*sailStates.alpha + (-0.027437)*sailStates.beta + (-1.457325)*sailStates.p + (1.915493)*sailStates.q + (-0.095720)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (3.090263)*sailStates.alpha + (0.435928)*sailStates.beta + (-1.977906)*sailStates.p + (17.755583)*sailStates.q + (-2.802238)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-14.137291)*sailStates.alpha + (2.754587)*sailStates.beta + (10.949553)*sailStates.p + (-159.650192)*sailStates.q + (10.607182)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (1.611497)*sailStates.alpha + (0.048589)*sailStates.beta + (3.077389)*sailStates.p + (-14.781297)*sailStates.q + (0.026449)*sailStates.r + (-0.000825)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end