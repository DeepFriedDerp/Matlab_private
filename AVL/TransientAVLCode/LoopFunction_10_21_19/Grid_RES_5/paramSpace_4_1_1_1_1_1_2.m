function [aeroForces] = paramSpace_4_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.382573)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.122522)*sailStates.p + (42.504368)*sailStates.q + (-1.902133)*sailStates.r + (0.011701)*sailStates.de;
	CD = -0.617050;
	CY = (-0.237610)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.671315)*sailStates.p + (-0.696927)*sailStates.q + (-0.094273)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.311252)*sailStates.alpha + (0.363606)*sailStates.beta + (-1.634648)*sailStates.p + (14.553904)*sailStates.q + (-1.633913)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-12.030761)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.774391)*sailStates.p + (-151.165665)*sailStates.q + (6.430612)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.649172)*sailStates.alpha + (0.051102)*sailStates.beta + (1.318347)*sailStates.p + (-4.521088)*sailStates.q + (-0.012509)*sailStates.r + (0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end