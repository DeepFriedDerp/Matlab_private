function [aeroForces] = paramSpace_7_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.506066)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.088045)*sailStates.p + (31.638395)*sailStates.q + (-1.170440)*sailStates.r + (0.011020)*sailStates.de;
	CD = -0.589910;
	CY = (-0.030171)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.484897)*sailStates.p + (-1.046666)*sailStates.q + (-0.016896)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (0.923045)*sailStates.alpha + (0.284817)*sailStates.beta + (-0.804104)*sailStates.p + (6.125396)*sailStates.q + (-1.094286)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.810064)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.011127)*sailStates.p + (-123.745377)*sailStates.q + (4.001118)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (-0.500068)*sailStates.alpha + (0.009946)*sailStates.beta + (1.092896)*sailStates.p + (-4.104806)*sailStates.q + (0.000830)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end