function [aeroForces] = paramSpace_12_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.863321)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.979029)*sailStates.p + (27.553379)*sailStates.q + (-0.986192)*sailStates.r + (0.010095)*sailStates.de;
	CD = -0.870190;
	CY = (0.284066)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.662339)*sailStates.p + (1.241893)*sailStates.q + (0.092954)*sailStates.r + (0.000264)*sailStates.de;

	Cl = (1.333633)*sailStates.alpha + (0.281347)*sailStates.beta + (-0.768960)*sailStates.p + (5.073335)*sailStates.q + (-1.072396)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-16.242554)*sailStates.alpha + (0.000000)*sailStates.beta + (7.703798)*sailStates.p + (-123.350212)*sailStates.q + (3.288789)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (-1.050078)*sailStates.alpha + (-0.039541)*sailStates.beta + (1.527460)*sailStates.p + (-7.918612)*sailStates.q + (-0.048909)*sailStates.r + (-0.000460)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end