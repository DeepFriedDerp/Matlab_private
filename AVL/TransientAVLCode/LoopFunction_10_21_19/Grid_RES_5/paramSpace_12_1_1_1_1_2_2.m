function [aeroForces] = paramSpace_12_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.263887)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.083206)*sailStates.p + (42.626114)*sailStates.q + (2.375465)*sailStates.r + (0.011886)*sailStates.de;
	CD = -1.013720;
	CY = (0.029848)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.937711)*sailStates.p + (-1.241890)*sailStates.q + (-0.131655)*sailStates.r + (-0.000268)*sailStates.de;

	Cl = (2.017363)*sailStates.alpha + (-0.419033)*sailStates.beta + (-1.609870)*sailStates.p + (14.621203)*sailStates.q + (1.972132)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-13.577083)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.323892)*sailStates.p + (-149.211060)*sailStates.q + (-7.917768)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.511895)*sailStates.alpha + (0.058891)*sailStates.beta + (-1.898235)*sailStates.p + (8.866115)*sailStates.q + (0.020977)*sailStates.r + (0.000555)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end