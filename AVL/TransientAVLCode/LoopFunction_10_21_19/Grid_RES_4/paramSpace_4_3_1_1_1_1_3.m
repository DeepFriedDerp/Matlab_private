function [aeroForces] = paramSpace_4_3_1_1_1_1_3(sailStates,airStates)

	CL = (4.910034)*sailStates.alpha + (0.080683)*sailStates.beta + (-3.114626)*sailStates.p + (34.814850)*sailStates.q + (-0.511010)*sailStates.r + (0.009618)*sailStates.de;
	CD = -1.515130;
	CY = (-0.438365)*sailStates.alpha + (-0.022744)*sailStates.beta + (-0.462566)*sailStates.p + (-2.326712)*sailStates.q + (0.092260)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.268430)*sailStates.alpha + (0.332137)*sailStates.beta + (-1.763177)*sailStates.p + (14.434570)*sailStates.q + (-0.820202)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-14.662121)*sailStates.alpha + (-0.369432)*sailStates.beta + (11.843065)*sailStates.p + (-156.352325)*sailStates.q + (1.657625)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.585559)*sailStates.alpha + (-0.061833)*sailStates.beta + (1.431166)*sailStates.p + (-5.863869)*sailStates.q + (-0.052546)*sailStates.r + (0.000551)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end