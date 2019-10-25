function [aeroForces] = paramSpace_11_1_4_1_2_1_2(sailStates,airStates)

	CL = (4.774086)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.020271)*sailStates.p + (36.712551)*sailStates.q + (-0.884588)*sailStates.r + (0.010671)*sailStates.de;
	CD = -0.795070;
	CY = (-0.034402)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.584314)*sailStates.p + (0.768919)*sailStates.q + (0.061495)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.773402)*sailStates.alpha + (0.261187)*sailStates.beta + (-1.607066)*sailStates.p + (13.018942)*sailStates.q + (-0.918051)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-15.236143)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.955321)*sailStates.p + (-151.567520)*sailStates.q + (2.926734)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.044412)*sailStates.alpha + (-0.027452)*sailStates.beta + (1.461337)*sailStates.p + (-7.906965)*sailStates.q + (-0.039694)*sailStates.r + (-0.000376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end