function [aeroForces] = paramSpace_5_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.449045)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.128209)*sailStates.p + (41.534615)*sailStates.q + (-1.656610)*sailStates.r + (0.011813)*sailStates.de;
	CD = -0.588480;
	CY = (-0.224060)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.577627)*sailStates.p + (-0.768919)*sailStates.q + (-0.060793)*sailStates.r + (-0.000167)*sailStates.de;

	Cl = (1.348322)*sailStates.alpha + (0.319792)*sailStates.beta + (-1.641425)*sailStates.p + (14.309606)*sailStates.q + (-1.409045)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-12.980321)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.062803)*sailStates.p + (-151.567520)*sailStates.q + (5.564997)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.547370)*sailStates.alpha + (0.033612)*sailStates.beta + (1.189022)*sailStates.p + (-4.372876)*sailStates.q + (-0.005109)*sailStates.r + (0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end