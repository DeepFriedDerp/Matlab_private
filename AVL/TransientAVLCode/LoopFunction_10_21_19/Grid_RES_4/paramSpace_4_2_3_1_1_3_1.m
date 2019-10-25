function [aeroForces] = paramSpace_4_2_3_1_1_3_1(sailStates,airStates)

	CL = (7.448835)*sailStates.alpha + (0.251017)*sailStates.beta + (-1.748556)*sailStates.p + (36.247639)*sailStates.q + (3.325299)*sailStates.r + (0.011751)*sailStates.de;
	CD = -3.004980;
	CY = (-0.693724)*sailStates.alpha + (-0.026077)*sailStates.beta + (1.420081)*sailStates.p + (-1.002333)*sailStates.q + (-0.282508)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (2.355342)*sailStates.alpha + (-0.600622)*sailStates.beta + (-0.502378)*sailStates.p + (5.550365)*sailStates.q + (2.849399)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-10.319498)*sailStates.alpha + (-0.949290)*sailStates.beta + (3.372891)*sailStates.p + (-108.591942)*sailStates.q + (-10.972951)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (2.603014)*sailStates.alpha + (0.138485)*sailStates.beta + (-3.141773)*sailStates.p + (14.789370)*sailStates.q + (0.078028)*sailStates.r + (0.000480)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end