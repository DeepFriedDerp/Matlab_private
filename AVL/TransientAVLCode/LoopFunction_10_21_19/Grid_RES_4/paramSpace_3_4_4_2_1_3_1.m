function [aeroForces] = paramSpace_3_4_4_2_1_3_1(sailStates,airStates)

	CL = (4.718198)*sailStates.alpha + (-0.356975)*sailStates.beta + (-2.163203)*sailStates.p + (32.718895)*sailStates.q + (1.500378)*sailStates.r + (0.010882)*sailStates.de;
	CD = -0.612890;
	CY = (-0.199702)*sailStates.alpha + (-0.023861)*sailStates.beta + (0.682078)*sailStates.p + (-0.668510)*sailStates.q + (-0.044776)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.290528)*sailStates.alpha + (-0.406109)*sailStates.beta + (-0.824792)*sailStates.p + (6.392399)*sailStates.q + (1.324049)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.019199)*sailStates.alpha + (1.447088)*sailStates.beta + (7.030245)*sailStates.p + (-124.743294)*sailStates.q + (-5.105651)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.764343)*sailStates.alpha + (0.017557)*sailStates.beta + (-1.451141)*sailStates.p + (6.852931)*sailStates.q + (0.011667)*sailStates.r + (0.000286)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end