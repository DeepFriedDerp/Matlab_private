function [aeroForces] = paramSpace_2_3_4_3_2_3_1(sailStates,airStates)

	CL = (4.219303)*sailStates.alpha + (-0.039912)*sailStates.beta + (-2.289731)*sailStates.p + (32.054958)*sailStates.q + (0.365653)*sailStates.r + (0.010807)*sailStates.de;
	CD = -0.161720;
	CY = (-0.036728)*sailStates.alpha + (-0.024993)*sailStates.beta + (0.265629)*sailStates.p + (-0.065301)*sailStates.q + (0.017403)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.128306)*sailStates.alpha + (-0.138370)*sailStates.beta + (-0.973913)*sailStates.p + (7.404663)*sailStates.q + (0.446374)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-15.052657)*sailStates.alpha + (0.188806)*sailStates.beta + (8.037567)*sailStates.p + (-130.047943)*sailStates.q + (-1.267784)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.282126)*sailStates.alpha + (-0.008108)*sailStates.beta + (-0.630189)*sailStates.p + (2.934909)*sailStates.q + (-0.008160)*sailStates.r + (0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end