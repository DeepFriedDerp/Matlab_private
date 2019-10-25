function [aeroForces] = paramSpace_1_1_1_1_3_1_3(sailStates,airStates)

	CL = (7.487739)*sailStates.alpha + (-0.865491)*sailStates.beta + (-3.432934)*sailStates.p + (50.557838)*sailStates.q + (-4.014659)*sailStates.r + (0.012352)*sailStates.de;
	CD = -3.130880;
	CY = (-0.259702)*sailStates.alpha + (-0.032916)*sailStates.beta + (-1.643540)*sailStates.p + (2.326711)*sailStates.q + (-0.327170)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (3.253641)*sailStates.alpha + (0.448168)*sailStates.beta + (-1.923527)*sailStates.p + (19.346624)*sailStates.q + (-3.436645)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-11.612910)*sailStates.alpha + (3.287354)*sailStates.beta + (8.802179)*sailStates.p + (-155.326050)*sailStates.q + (13.292073)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (2.067256)*sailStates.alpha + (0.157352)*sailStates.beta + (3.316267)*sailStates.p + (-15.063122)*sailStates.q + (0.052157)*sailStates.r + (-0.000955)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end