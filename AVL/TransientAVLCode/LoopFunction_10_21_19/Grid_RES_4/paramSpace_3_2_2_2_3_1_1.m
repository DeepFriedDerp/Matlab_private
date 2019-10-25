function [aeroForces] = paramSpace_3_2_2_2_3_1_1(sailStates,airStates)

	CL = (4.633871)*sailStates.alpha + (-0.070650)*sailStates.beta + (-2.145974)*sailStates.p + (30.451990)*sailStates.q + (-0.933432)*sailStates.r + (0.010628)*sailStates.de;
	CD = -0.549560;
	CY = (0.196858)*sailStates.alpha + (-0.024697)*sailStates.beta + (-0.549383)*sailStates.p + (0.870357)*sailStates.q + (0.035978)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (1.329222)*sailStates.alpha + (0.218478)*sailStates.beta + (-0.892350)*sailStates.p + (6.607003)*sailStates.q + (-0.933518)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-15.430677)*sailStates.alpha + (0.286786)*sailStates.beta + (7.728004)*sailStates.p + (-126.510948)*sailStates.q + (3.161269)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (-0.715078)*sailStates.alpha + (-0.016620)*sailStates.beta + (1.248363)*sailStates.p + (-6.406112)*sailStates.q + (-0.016803)*sailStates.r + (-0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end