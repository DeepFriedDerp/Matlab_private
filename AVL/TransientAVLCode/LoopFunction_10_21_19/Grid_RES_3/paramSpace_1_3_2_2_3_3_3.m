function [aeroForces] = paramSpace_1_3_2_2_3_3_3(sailStates,airStates)

	CL = (4.015294)*sailStates.alpha + (-0.007194)*sailStates.beta + (-2.787646)*sailStates.p + (35.201340)*sailStates.q + (-0.189476)*sailStates.r + (0.010160)*sailStates.de;
	CD = -0.226520;
	CY = (0.142226)*sailStates.alpha + (-0.022243)*sailStates.beta + (0.109715)*sailStates.p + (1.027328)*sailStates.q + (0.019346)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.252062)*sailStates.alpha + (-0.082372)*sailStates.beta + (-1.410613)*sailStates.p + (11.538988)*sailStates.q + (0.080601)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-14.467385)*sailStates.alpha + (0.087337)*sailStates.beta + (9.896520)*sailStates.p + (-144.553238)*sailStates.q + (0.667980)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.047822)*sailStates.alpha + (-0.013414)*sailStates.beta + (-0.501658)*sailStates.p + (2.309693)*sailStates.q + (-0.030386)*sailStates.r + (-0.000246)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end