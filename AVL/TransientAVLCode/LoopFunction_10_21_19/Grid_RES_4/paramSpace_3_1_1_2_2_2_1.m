function [aeroForces] = paramSpace_3_1_1_2_2_2_1(sailStates,airStates)

	CL = (3.951221)*sailStates.alpha + (0.029858)*sailStates.beta + (-2.145235)*sailStates.p + (31.419727)*sailStates.q + (0.266088)*sailStates.r + (0.010732)*sailStates.de;
	CD = 0.030530;
	CY = (0.006409)*sailStates.alpha + (-0.024710)*sailStates.beta + (0.036594)*sailStates.p + (0.100924)*sailStates.q + (-0.002409)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.088644)*sailStates.alpha + (-0.005537)*sailStates.beta + (-0.919302)*sailStates.p + (7.266394)*sailStates.q + (0.151827)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.403042)*sailStates.alpha + (-0.023464)*sailStates.beta + (7.351850)*sailStates.p + (-125.105080)*sailStates.q + (-0.875640)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.014791)*sailStates.alpha + (0.001131)*sailStates.beta + (-0.053215)*sailStates.p + (0.146580)*sailStates.q + (-0.002772)*sailStates.r + (-0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end