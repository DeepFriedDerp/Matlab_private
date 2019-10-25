function [aeroForces] = paramSpace_3_1_3_1_3_2_1(sailStates,airStates)

	CL = (3.793910)*sailStates.alpha + (0.002371)*sailStates.beta + (-1.679390)*sailStates.p + (27.449652)*sailStates.q + (-0.223815)*sailStates.r + (0.010470)*sailStates.de;
	CD = -0.015380;
	CY = (0.317157)*sailStates.alpha + (-0.022540)*sailStates.beta + (-0.227329)*sailStates.p + (1.915493)*sailStates.q + (0.014967)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.765271)*sailStates.alpha + (0.017999)*sailStates.beta + (-0.535546)*sailStates.p + (3.580792)*sailStates.q + (-0.214498)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-13.886511)*sailStates.alpha + (-0.054462)*sailStates.beta + (5.929613)*sailStates.p + (-112.650780)*sailStates.q + (0.722892)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-0.569383)*sailStates.alpha + (-0.005313)*sailStates.beta + (0.479862)*sailStates.p + (-3.665064)*sailStates.q + (-0.015220)*sailStates.r + (-0.000581)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end