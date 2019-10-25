function [aeroForces] = paramSpace_5_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.448810)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.127722)*sailStates.p + (41.561291)*sailStates.q + (-1.666296)*sailStates.r + (0.011764)*sailStates.de;
	CD = -0.604930;
	CY = (-0.227263)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.592662)*sailStates.p + (-0.768920)*sailStates.q + (-0.062318)*sailStates.r + (-0.000167)*sailStates.de;

	Cl = (1.343272)*sailStates.alpha + (0.327307)*sailStates.beta + (-1.641202)*sailStates.p + (14.310802)*sailStates.q + (-1.433430)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-12.864583)*sailStates.alpha + (0.000000)*sailStates.beta + (10.056962)*sailStates.p + (-151.567520)*sailStates.q + (5.620583)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.558371)*sailStates.alpha + (0.034401)*sailStates.beta + (1.211298)*sailStates.p + (-4.384267)*sailStates.q + (-0.005192)*sailStates.r + (0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end