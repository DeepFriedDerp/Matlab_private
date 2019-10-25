function [aeroForces] = paramSpace_2_2_4_3_3_2_1(sailStates,airStates)

	CL = (4.074652)*sailStates.alpha + (-0.016923)*sailStates.beta + (-2.301745)*sailStates.p + (32.863350)*sailStates.q + (-0.416958)*sailStates.r + (0.010963)*sailStates.de;
	CD = 0.022350;
	CY = (0.067691)*sailStates.alpha + (-0.025085)*sailStates.beta + (-0.123244)*sailStates.p + (0.432842)*sailStates.q + (-0.008032)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.164456)*sailStates.alpha + (0.035237)*sailStates.beta + (-1.008830)*sailStates.p + (8.023408)*sailStates.q + (-0.272530)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.744798)*sailStates.alpha + (0.031243)*sailStates.beta + (7.835410)*sailStates.p + (-129.813766)*sailStates.q + (1.378453)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.092460)*sailStates.alpha + (0.002940)*sailStates.beta + (0.225390)*sailStates.p + (-1.302662)*sailStates.q + (0.000899)*sailStates.r + (-0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end