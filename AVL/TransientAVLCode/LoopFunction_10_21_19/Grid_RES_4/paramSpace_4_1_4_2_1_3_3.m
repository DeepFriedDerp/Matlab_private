function [aeroForces] = paramSpace_4_1_4_2_1_3_3(sailStates,airStates)

	CL = (4.666774)*sailStates.alpha + (0.521201)*sailStates.beta + (-2.902377)*sailStates.p + (42.115932)*sailStates.q + (2.364662)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.639570;
	CY = (0.003545)*sailStates.alpha + (-0.028480)*sailStates.beta + (0.878347)*sailStates.p + (-1.057313)*sailStates.q + (-0.174828)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.828094)*sailStates.alpha + (-0.232706)*sailStates.beta + (-1.529403)*sailStates.p + (14.481929)*sailStates.q + (1.952081)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-12.084304)*sailStates.alpha + (-2.002160)*sailStates.beta + (8.417268)*sailStates.p + (-143.598221)*sailStates.q + (-7.872304)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.487471)*sailStates.alpha + (0.082485)*sailStates.beta + (-1.685923)*sailStates.p + (7.155109)*sailStates.q + (0.007421)*sailStates.r + (0.000429)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end