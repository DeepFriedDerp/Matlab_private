function [aeroForces] = paramSpace_10_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.343141)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.011170)*sailStates.p + (29.320404)*sailStates.q + (-0.730451)*sailStates.r + (0.010443)*sailStates.de;
	CD = -0.500600;
	CY = (-0.024519)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.366662)*sailStates.p + (-0.839978)*sailStates.q + (0.025551)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (0.911221)*sailStates.alpha + (0.217268)*sailStates.beta + (-0.773796)*sailStates.p + (5.516902)*sailStates.q + (-0.769736)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.584689)*sailStates.alpha + (0.000000)*sailStates.beta + (7.232535)*sailStates.p + (-122.784714)*sailStates.q + (2.456352)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (-0.480992)*sailStates.alpha + (-0.015193)*sailStates.beta + (0.909906)*sailStates.p + (-3.753562)*sailStates.q + (-0.006099)*sailStates.r + (0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end