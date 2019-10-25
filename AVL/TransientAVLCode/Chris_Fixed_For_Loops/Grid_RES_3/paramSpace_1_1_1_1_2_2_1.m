function [aeroForces] = paramSpace_1_1_1_1_2_2_1(sailStates,airStates)

	CL = (2.364604)*sailStates.alpha + (0.023679)*sailStates.beta + (-4.707938)*sailStates.p + (49.671108)*sailStates.q + (-0.091663)*sailStates.r + (0.010916)*sailStates.de;
	CD = -0.789100;
	CY = (0.471396)*sailStates.alpha + (-0.027163)*sailStates.beta + (0.279938)*sailStates.p + (1.591304)*sailStates.q + (0.049209)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (0.562778)*sailStates.alpha + (-0.218338)*sailStates.beta + (-3.061573)*sailStates.p + (26.956236)*sailStates.q + (0.196901)*sailStates.r + (0.003596)*sailStates.de;
	Cm = (-6.892023)*sailStates.alpha + (-0.100408)*sailStates.beta + (16.794067)*sailStates.p + (-200.036926)*sailStates.q + (0.412035)*sailStates.r + (-0.076143)*sailStates.de;
	Cn = (-1.387186)*sailStates.alpha + (-0.041297)*sailStates.beta + (-1.213690)*sailStates.p + (6.678275)*sailStates.q + (-0.084049)*sailStates.r + (-0.000299)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end