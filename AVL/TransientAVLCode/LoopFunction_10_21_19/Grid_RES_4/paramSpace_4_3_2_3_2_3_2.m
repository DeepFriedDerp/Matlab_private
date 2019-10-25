function [aeroForces] = paramSpace_4_3_2_3_2_3_2(sailStates,airStates)

	CL = (4.202797)*sailStates.alpha + (-0.116574)*sailStates.beta + (-2.530432)*sailStates.p + (37.587051)*sailStates.q + (1.643432)*sailStates.r + (0.011141)*sailStates.de;
	CD = -0.187310;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.517505)*sailStates.p + (-0.000000)*sailStates.q + (-0.102938)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.277602)*sailStates.alpha + (-0.293896)*sailStates.beta + (-1.163278)*sailStates.p + (10.322192)*sailStates.q + (1.275763)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.897681)*sailStates.alpha + (0.421472)*sailStates.beta + (7.743952)*sailStates.p + (-134.847153)*sailStates.q + (-5.463520)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.001179)*sailStates.alpha + (0.051427)*sailStates.beta + (-0.990233)*sailStates.p + (3.806439)*sailStates.q + (-0.010795)*sailStates.r + (0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end