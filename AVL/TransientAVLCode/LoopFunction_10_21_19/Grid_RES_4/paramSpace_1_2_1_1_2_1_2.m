function [aeroForces] = paramSpace_1_2_1_1_2_1_2(sailStates,airStates)

	CL = (6.511284)*sailStates.alpha + (-0.254079)*sailStates.beta + (-2.649024)*sailStates.p + (43.287125)*sailStates.q + (-3.251448)*sailStates.r + (0.012075)*sailStates.de;
	CD = -2.410500;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-1.275401)*sailStates.p + (-0.000001)*sailStates.q + (-0.253693)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.972855)*sailStates.alpha + (0.566170)*sailStates.beta + (-1.232110)*sailStates.p + (12.202874)*sailStates.q + (-2.804199)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-10.345265)*sailStates.alpha + (0.981723)*sailStates.beta + (6.684373)*sailStates.p + (-134.847153)*sailStates.q + (10.790385)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.101909)*sailStates.alpha + (0.129050)*sailStates.beta + (2.686244)*sailStates.p + (-11.186613)*sailStates.q + (0.024916)*sailStates.r + (-0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end