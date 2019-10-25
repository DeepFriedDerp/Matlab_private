function [aeroForces] = paramSpace_6_1_3_1_1_2_2(sailStates,airStates)

	CL = (4.960163)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.052556)*sailStates.p + (37.441132)*sailStates.q + (1.114129)*sailStates.r + (0.010999)*sailStates.de;
	CD = -0.890160;
	CY = (0.041101)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.667995)*sailStates.p + (-0.839976)*sailStates.q + (0.046681)*sailStates.r + (-0.000183)*sailStates.de;

	Cl = (1.835002)*sailStates.alpha + (-0.300056)*sailStates.beta + (-1.620357)*sailStates.p + (13.216254)*sailStates.q + (1.117198)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-15.371410)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.881511)*sailStates.p + (-151.784744)*sailStates.q + (-3.775652)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (-0.129114)*sailStates.alpha + (-0.020982)*sailStates.beta + (-1.570203)*sailStates.p + (8.090587)*sailStates.q + (-0.023762)*sailStates.r + (0.000377)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end