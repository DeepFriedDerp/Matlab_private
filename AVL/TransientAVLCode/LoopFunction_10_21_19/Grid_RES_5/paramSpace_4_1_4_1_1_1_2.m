function [aeroForces] = paramSpace_4_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.426025)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.124435)*sailStates.p + (42.398232)*sailStates.q + (-1.873396)*sailStates.r + (0.011897)*sailStates.de;
	CD = -0.595740;
	CY = (-0.227996)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.626584)*sailStates.p + (-0.696926)*sailStates.q + (-0.088135)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.328010)*sailStates.alpha + (0.341251)*sailStates.beta + (-1.635519)*sailStates.p + (14.549144)*sailStates.q + (-1.561189)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-12.485295)*sailStates.alpha + (0.000000)*sailStates.beta + (9.797666)*sailStates.p + (-151.165665)*sailStates.q + (6.265004)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.616739)*sailStates.alpha + (0.047960)*sailStates.beta + (1.251652)*sailStates.p + (-4.487215)*sailStates.q + (-0.011327)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end