function [aeroForces] = paramSpace_4_3_4_3_2_3_2(sailStates,airStates)

	CL = (4.132922)*sailStates.alpha + (-0.130434)*sailStates.beta + (-2.529002)*sailStates.p + (37.684280)*sailStates.q + (1.660456)*sailStates.r + (0.010965)*sailStates.de;
	CD = -0.173020;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.546433)*sailStates.p + (0.000000)*sailStates.q + (-0.108692)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.276483)*sailStates.alpha + (-0.308758)*sailStates.beta + (-1.162592)*sailStates.p + (10.326643)*sailStates.q + (1.322674)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.493769)*sailStates.alpha + (0.510130)*sailStates.beta + (7.724504)*sailStates.p + (-134.847153)*sailStates.q + (-5.561289)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.003014)*sailStates.alpha + (0.054318)*sailStates.beta + (-1.033883)*sailStates.p + (3.828814)*sailStates.q + (-0.011745)*sailStates.r + (0.000069)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end