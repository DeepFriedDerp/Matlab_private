function [aeroForces] = paramSpace_4_3_3_3_3_2_3(sailStates,airStates)

	CL = (3.765599)*sailStates.alpha + (-0.071058)*sailStates.beta + (-2.744884)*sailStates.p + (37.362751)*sailStates.q + (0.966386)*sailStates.r + (0.010720)*sailStates.de;
	CD = 0.090060;
	CY = (0.057602)*sailStates.alpha + (-0.025300)*sailStates.beta + (0.182102)*sailStates.p + (0.294836)*sailStates.q + (-0.036212)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.224595)*sailStates.alpha + (-0.124363)*sailStates.beta + (-1.361891)*sailStates.p + (11.665621)*sailStates.q + (0.665755)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-13.449385)*sailStates.alpha + (0.266247)*sailStates.beta + (9.143579)*sailStates.p + (-142.570129)*sailStates.q + (-3.270430)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.267120)*sailStates.alpha + (0.022308)*sailStates.beta + (-0.182071)*sailStates.p + (-0.337101)*sailStates.q + (-0.042370)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end