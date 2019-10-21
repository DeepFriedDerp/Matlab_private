function [aeroForces] = paramSpace_1_2_1_1_2_2_2(sailStates,airStates)

	CL = (5.715816)*sailStates.alpha + (-0.873335)*sailStates.beta + (-6.448391)*sailStates.p + (57.755562)*sailStates.q + (2.806304)*sailStates.r + (0.011065)*sailStates.de;
	CD = -9.903050;
	CY = (3.306750)*sailStates.alpha + (-0.016914)*sailStates.beta + (1.568907)*sailStates.p + (4.605081)*sailStates.q + (0.207203)*sailStates.r + (0.001054)*sailStates.de;

	Cl = (-2.118485)*sailStates.alpha + (-1.123322)*sailStates.beta + (-4.495787)*sailStates.p + (38.689484)*sailStates.q + (3.014135)*sailStates.r + (0.006082)*sailStates.de;
	Cm = (12.717022)*sailStates.alpha + (3.672600)*sailStates.beta + (24.234154)*sailStates.p + (-250.494507)*sailStates.q + (-9.512309)*sailStates.r + (-0.084457)*sailStates.de;
	Cn = (-12.724463)*sailStates.alpha + (-0.112902)*sailStates.beta + (-4.238421)*sailStates.p + (18.138508)*sailStates.q + (-0.085135)*sailStates.r + (-0.000798)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end