function [aeroForces] = paramSpace_1_1_2_3_1_3_2(sailStates,airStates)

	CL = (4.011126)*sailStates.alpha + (-0.010492)*sailStates.beta + (-2.454142)*sailStates.p + (32.858723)*sailStates.q + (-0.088927)*sailStates.r + (0.010198)*sailStates.de;
	CD = -0.126360;
	CY = (-0.058338)*sailStates.alpha + (-0.023592)*sailStates.beta + (0.185765)*sailStates.p + (-0.491626)*sailStates.q + (0.032755)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.317963)*sailStates.alpha + (-0.078819)*sailStates.beta + (-1.203011)*sailStates.p + (9.781481)*sailStates.q + (0.108464)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-14.692727)*sailStates.alpha + (0.009611)*sailStates.beta + (8.794865)*sailStates.p + (-135.234573)*sailStates.q + (0.350185)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.309258)*sailStates.alpha + (-0.019318)*sailStates.beta + (-0.590141)*sailStates.p + (3.708005)*sailStates.q + (-0.047530)*sailStates.r + (0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end