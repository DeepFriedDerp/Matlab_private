function [aeroForces] = paramSpace_1_2_1_3_1_2_3(sailStates,airStates)

	CL = (3.790150)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.767658)*sailStates.p + (37.358768)*sailStates.q + (-0.856031)*sailStates.r + (0.010773)*sailStates.de;
	CD = 0.092370;
	CY = (-0.058615)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.167102)*sailStates.p + (-0.318253)*sailStates.q + (-0.029434)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.264440)*sailStates.alpha + (0.096244)*sailStates.beta + (-1.389666)*sailStates.p + (11.847516)*sailStates.q + (-0.606219)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-13.570415)*sailStates.alpha + (0.000000)*sailStates.beta + (9.277370)*sailStates.p + (-143.204193)*sailStates.q + (2.922152)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.258611)*sailStates.alpha + (0.016970)*sailStates.beta + (0.159680)*sailStates.p + (0.445419)*sailStates.q + (-0.035792)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end