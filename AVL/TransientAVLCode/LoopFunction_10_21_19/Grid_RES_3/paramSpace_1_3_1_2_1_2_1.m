function [aeroForces] = paramSpace_1_3_1_2_1_2_1(sailStates,airStates)

	CL = (3.739425)*sailStates.alpha + (0.145425)*sailStates.beta + (-2.114228)*sailStates.p + (31.657618)*sailStates.q + (-0.550746)*sailStates.r + (0.010322)*sailStates.de;
	CD = 0.077420;
	CY = (-0.117269)*sailStates.alpha + (-0.027673)*sailStates.beta + (-0.052276)*sailStates.p + (-1.027327)*sailStates.q + (-0.009120)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.877017)*sailStates.alpha + (0.092620)*sailStates.beta + (-0.816039)*sailStates.p + (6.198699)*sailStates.q + (-0.349755)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-13.494419)*sailStates.alpha + (-0.604551)*sailStates.beta + (7.208301)*sailStates.p + (-124.672363)*sailStates.q + (1.906215)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.154884)*sailStates.alpha + (0.016267)*sailStates.beta + (0.021932)*sailStates.p + (1.079278)*sailStates.q + (-0.032787)*sailStates.r + (0.000302)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end