function [aeroForces] = paramSpace_2_2_4_3_2_3_1(sailStates,airStates)

	CL = (4.219303)*sailStates.alpha + (0.039912)*sailStates.beta + (-2.289731)*sailStates.p + (32.054958)*sailStates.q + (0.365653)*sailStates.r + (0.010807)*sailStates.de;
	CD = -0.161720;
	CY = (-0.036728)*sailStates.alpha + (-0.024960)*sailStates.beta + (0.265629)*sailStates.p + (-0.065301)*sailStates.q + (0.017403)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.182947)*sailStates.alpha + (-0.121833)*sailStates.beta + (-1.006565)*sailStates.p + (7.808539)*sailStates.q + (0.444277)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-15.052657)*sailStates.alpha + (-0.188806)*sailStates.beta + (8.037567)*sailStates.p + (-130.047943)*sailStates.q + (-1.267785)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.274302)*sailStates.alpha + (-0.008947)*sailStates.beta + (-0.632329)*sailStates.p + (2.961380)*sailStates.q + (-0.008298)*sailStates.r + (0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end