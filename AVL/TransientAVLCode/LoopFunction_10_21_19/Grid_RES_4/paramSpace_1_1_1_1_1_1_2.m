function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (5.426614)*sailStates.alpha + (-0.699264)*sailStates.beta + (-2.679240)*sailStates.p + (42.743984)*sailStates.q + (-2.817914)*sailStates.r + (0.011914)*sailStates.de;
	CD = -1.857760;
	CY = (-0.238183)*sailStates.alpha + (-0.018970)*sailStates.beta + (-1.009112)*sailStates.p + (-1.664522)*sailStates.q + (-0.200546)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.127333)*sailStates.alpha + (0.380444)*sailStates.beta + (-1.285243)*sailStates.p + (12.436172)*sailStates.q + (-2.455355)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-9.049037)*sailStates.alpha + (2.735628)*sailStates.beta + (7.192033)*sailStates.p + (-136.195908)*sailStates.q + (9.389793)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.224950)*sailStates.alpha + (0.111093)*sailStates.beta + (2.119483)*sailStates.p + (-7.315324)*sailStates.q + (-0.016596)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end