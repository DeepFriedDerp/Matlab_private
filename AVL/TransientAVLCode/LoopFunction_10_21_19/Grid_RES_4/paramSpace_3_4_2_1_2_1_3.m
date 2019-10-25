function [aeroForces] = paramSpace_3_4_2_1_2_1_3(sailStates,airStates)

	CL = (5.836808)*sailStates.alpha + (0.443846)*sailStates.beta + (-3.374007)*sailStates.p + (39.203125)*sailStates.q + (-1.779955)*sailStates.r + (0.010808)*sailStates.de;
	CD = -2.194560;
	CY = (-0.373729)*sailStates.alpha + (-0.024573)*sailStates.beta + (-0.946607)*sailStates.p + (-0.221994)*sailStates.q + (0.062052)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.854509)*sailStates.alpha + (0.592311)*sailStates.beta + (-1.854435)*sailStates.p + (15.111788)*sailStates.q + (-1.772707)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-14.129253)*sailStates.alpha + (-1.797192)*sailStates.beta + (12.138996)*sailStates.p + (-160.446381)*sailStates.q + (6.050760)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (0.959726)*sailStates.alpha + (-0.027528)*sailStates.beta + (2.238342)*sailStates.p + (-10.388148)*sailStates.q + (-0.022630)*sailStates.r + (-0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end