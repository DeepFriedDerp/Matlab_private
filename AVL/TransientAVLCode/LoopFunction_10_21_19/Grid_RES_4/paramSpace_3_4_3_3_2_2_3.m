function [aeroForces] = paramSpace_3_4_3_3_2_2_3(sailStates,airStates)

	CL = (3.954784)*sailStates.alpha + (-0.084600)*sailStates.beta + (-2.807226)*sailStates.p + (36.819550)*sailStates.q + (0.369688)*sailStates.r + (0.010986)*sailStates.de;
	CD = 0.033370;
	CY = (0.001943)*sailStates.alpha + (-0.024710)*sailStates.beta + (0.093057)*sailStates.p + (-0.065300)*sailStates.q + (-0.006102)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.258392)*sailStates.alpha + (-0.067912)*sailStates.beta + (-1.362517)*sailStates.p + (11.080903)*sailStates.q + (0.263634)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.304484)*sailStates.alpha + (0.335148)*sailStates.beta + (9.557000)*sailStates.p + (-143.297119)*sailStates.q + (-1.262532)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.067819)*sailStates.alpha + (0.003219)*sailStates.beta + (-0.122962)*sailStates.p + (0.293188)*sailStates.q + (-0.003393)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end