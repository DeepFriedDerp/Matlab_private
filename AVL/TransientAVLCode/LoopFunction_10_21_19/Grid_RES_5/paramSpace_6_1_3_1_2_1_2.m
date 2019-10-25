function [aeroForces] = paramSpace_6_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.208148)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.102903)*sailStates.p + (40.827557)*sailStates.q + (-1.959445)*sailStates.r + (0.011659)*sailStates.de;
	CD = -0.993920;
	CY = (-0.035958)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.858424)*sailStates.p + (1.113126)*sailStates.q + (-0.059988)*sailStates.r + (0.000242)*sailStates.de;

	Cl = (1.976326)*sailStates.alpha + (0.384233)*sailStates.beta + (-1.629868)*sailStates.p + (14.116355)*sailStates.q + (-1.697669)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.338913)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.035046)*sailStates.p + (-150.805054)*sailStates.q + (6.611062)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (0.386024)*sailStates.alpha + (0.026868)*sailStates.beta + (1.797571)*sailStates.p + (-8.647596)*sailStates.q + (0.014883)*sailStates.r + (-0.000496)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end