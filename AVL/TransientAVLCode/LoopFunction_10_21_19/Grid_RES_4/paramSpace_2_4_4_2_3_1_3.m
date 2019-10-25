function [aeroForces] = paramSpace_2_4_4_2_3_1_3(sailStates,airStates)

	CL = (4.711321)*sailStates.alpha + (0.306771)*sailStates.beta + (-2.968342)*sailStates.p + (39.186802)*sailStates.q + (-1.579852)*sailStates.r + (0.011360)*sailStates.de;
	CD = -0.593700;
	CY = (-0.000053)*sailStates.alpha + (-0.024133)*sailStates.beta + (-0.670159)*sailStates.p + (0.870358)*sailStates.q + (-0.043833)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.657112)*sailStates.alpha + (0.400408)*sailStates.beta + (-1.482261)*sailStates.p + (12.487874)*sailStates.q + (-1.339070)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.230721)*sailStates.alpha + (-1.087525)*sailStates.beta + (9.725456)*sailStates.p + (-146.834106)*sailStates.q + (5.308928)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.142529)*sailStates.alpha + (0.017701)*sailStates.beta + (1.409185)*sailStates.p + (-6.872236)*sailStates.q + (0.010587)*sailStates.r + (-0.000398)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end