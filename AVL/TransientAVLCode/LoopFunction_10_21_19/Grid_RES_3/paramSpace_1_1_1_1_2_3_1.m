function [aeroForces] = paramSpace_1_1_1_1_2_3_1(sailStates,airStates)

	CL = (5.412342)*sailStates.alpha + (0.315825)*sailStates.beta + (-1.473580)*sailStates.p + (20.758505)*sailStates.q + (1.667144)*sailStates.r + (0.008742)*sailStates.de;
	CD = -2.043440;
	CY = (-0.406282)*sailStates.alpha + (-0.023200)*sailStates.beta + (0.914292)*sailStates.p + (-0.589406)*sailStates.q + (0.161270)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.115452)*sailStates.alpha + (-0.325995)*sailStates.beta + (-0.455719)*sailStates.p + (1.760415)*sailStates.q + (1.698457)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-15.796852)*sailStates.alpha + (-1.169761)*sailStates.beta + (6.762067)*sailStates.p + (-110.634644)*sailStates.q + (-5.453536)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (1.937456)*sailStates.alpha + (-0.085751)*sailStates.beta + (-2.128476)*sailStates.p + (10.199990)*sailStates.q + (-0.061853)*sailStates.r + (0.000325)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end