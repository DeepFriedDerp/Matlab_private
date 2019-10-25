function [aeroForces] = paramSpace_2_4_4_3_2_3_3(sailStates,airStates)

	CL = (4.145984)*sailStates.alpha + (-0.110708)*sailStates.beta + (-2.790737)*sailStates.p + (36.005611)*sailStates.q + (0.301013)*sailStates.r + (0.010890)*sailStates.de;
	CD = -0.157060;
	CY = (0.034460)*sailStates.alpha + (-0.024737)*sailStates.beta + (0.245127)*sailStates.p + (0.065300)*sailStates.q + (0.016073)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.295235)*sailStates.alpha + (-0.144067)*sailStates.beta + (-1.357386)*sailStates.p + (10.873237)*sailStates.q + (0.394837)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.721689)*sailStates.alpha + (0.535689)*sailStates.beta + (9.708885)*sailStates.p + (-143.297119)*sailStates.q + (-1.054787)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.057390)*sailStates.alpha + (-0.006822)*sailStates.beta + (-0.613450)*sailStates.p + (2.875184)*sailStates.q + (-0.008819)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end