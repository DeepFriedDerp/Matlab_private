function [aeroForces] = paramSpace_3_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.262416)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.061237)*sailStates.p + (43.610886)*sailStates.q + (-2.595093)*sailStates.r + (0.011854)*sailStates.de;
	CD = -1.039360;
	CY = (-0.031076)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.996664)*sailStates.p + (1.304044)*sailStates.q + (-0.175692)*sailStates.r + (0.000280)*sailStates.de;

	Cl = (2.037350)*sailStates.alpha + (0.446310)*sailStates.beta + (-1.593379)*sailStates.p + (14.888766)*sailStates.q + (-2.143363)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-12.883464)*sailStates.alpha + (0.000000)*sailStates.beta + (8.886015)*sailStates.p + (-148.140839)*sailStates.q + (8.619811)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.591695)*sailStates.alpha + (0.078697)*sailStates.beta + (1.981787)*sailStates.p + (-8.976435)*sailStates.q + (0.020964)*sailStates.r + (-0.000563)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end