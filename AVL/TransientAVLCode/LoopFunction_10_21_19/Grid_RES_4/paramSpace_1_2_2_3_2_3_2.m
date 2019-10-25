function [aeroForces] = paramSpace_1_2_2_3_2_3_2(sailStates,airStates)

	CL = (3.926891)*sailStates.alpha + (-0.020897)*sailStates.beta + (-2.429886)*sailStates.p + (32.977135)*sailStates.q + (-0.329287)*sailStates.r + (0.010130)*sailStates.de;
	CD = -0.057240;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.074139)*sailStates.p + (-0.000000)*sailStates.q + (0.014747)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.232622)*sailStates.alpha + (-0.044257)*sailStates.beta + (-1.162886)*sailStates.p + (9.491435)*sailStates.q + (-0.078943)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-14.482121)*sailStates.alpha + (0.073690)*sailStates.beta + (8.599058)*sailStates.p + (-134.847153)*sailStates.q + (1.164615)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.240581)*sailStates.alpha + (-0.009458)*sailStates.beta + (-0.373320)*sailStates.p + (2.444712)*sailStates.q + (-0.043968)*sailStates.r + (0.000037)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end