function [aeroForces] = paramSpace_4_2_2_3_2_3_2(sailStates,airStates)

	CL = (4.202797)*sailStates.alpha + (0.116574)*sailStates.beta + (-2.530432)*sailStates.p + (37.587051)*sailStates.q + (1.643432)*sailStates.r + (0.011141)*sailStates.de;
	CD = -0.187310;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.517505)*sailStates.p + (-0.000000)*sailStates.q + (-0.102938)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.321787)*sailStates.alpha + (-0.222708)*sailStates.beta + (-1.194821)*sailStates.p + (10.719160)*sailStates.q + (1.282023)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-12.897681)*sailStates.alpha + (-0.421472)*sailStates.beta + (7.743952)*sailStates.p + (-134.847153)*sailStates.q + (-5.463520)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.033434)*sailStates.alpha + (0.051332)*sailStates.beta + (-0.983958)*sailStates.p + (3.727477)*sailStates.q + (-0.012040)*sailStates.r + (0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end