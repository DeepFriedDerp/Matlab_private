function [aeroForces] = paramSpace_2_3_3_2_1_3_1(sailStates,airStates)

	CL = (4.633871)*sailStates.alpha + (-0.070650)*sailStates.beta + (-2.145974)*sailStates.p + (30.451990)*sailStates.q + (0.933432)*sailStates.r + (0.010628)*sailStates.de;
	CD = -0.549560;
	CY = (-0.196858)*sailStates.alpha + (-0.025256)*sailStates.beta + (0.549383)*sailStates.p + (-0.870357)*sailStates.q + (0.035978)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.272258)*sailStates.alpha + (-0.260221)*sailStates.beta + (-0.859701)*sailStates.p + (6.203124)*sailStates.q + (0.935644)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-15.430676)*sailStates.alpha + (0.286786)*sailStates.beta + (7.728004)*sailStates.p + (-126.510948)*sailStates.q + (-3.161270)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.732329)*sailStates.alpha + (-0.014755)*sailStates.beta + (-1.246223)*sailStates.p + (6.379641)*sailStates.q + (-0.016664)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end