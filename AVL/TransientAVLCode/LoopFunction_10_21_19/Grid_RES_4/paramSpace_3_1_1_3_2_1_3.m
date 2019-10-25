function [aeroForces] = paramSpace_3_1_1_3_2_1_3(sailStates,airStates)

	CL = (4.145984)*sailStates.alpha + (-0.110708)*sailStates.beta + (-2.790737)*sailStates.p + (36.005611)*sailStates.q + (-0.301013)*sailStates.r + (0.010890)*sailStates.de;
	CD = -0.157060;
	CY = (-0.034460)*sailStates.alpha + (-0.024835)*sailStates.beta + (-0.245127)*sailStates.p + (-0.065300)*sailStates.q + (0.016073)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.436486)*sailStates.alpha + (0.105104)*sailStates.beta + (-1.455091)*sailStates.p + (12.081800)*sailStates.q + (-0.388561)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.721689)*sailStates.alpha + (0.535689)*sailStates.beta + (9.708885)*sailStates.p + (-143.297119)*sailStates.q + (1.054787)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.033824)*sailStates.alpha + (-0.009509)*sailStates.beta + (0.619854)*sailStates.p + (-2.954398)*sailStates.q + (-0.009230)*sailStates.r + (-0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end