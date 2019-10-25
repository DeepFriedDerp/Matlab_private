function [aeroForces] = paramSpace_1_1_1_2_3_1_3(sailStates,airStates)

	CL = (4.706995)*sailStates.alpha + (-0.439192)*sailStates.beta + (-2.924664)*sailStates.p + (41.672089)*sailStates.q + (-2.240750)*sailStates.r + (0.011330)*sailStates.de;
	CD = -0.641460;
	CY = (-0.003831)*sailStates.alpha + (-0.027673)*sailStates.beta + (-0.850945)*sailStates.p + (1.027327)*sailStates.q + (-0.150142)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.825909)*sailStates.alpha + (0.246653)*sailStates.beta + (-1.538437)*sailStates.p + (14.295582)*sailStates.q + (-1.861025)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-12.549889)*sailStates.alpha + (1.692110)*sailStates.beta + (8.693673)*sailStates.p + (-144.553253)*sailStates.q + (7.489660)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.441877)*sailStates.alpha + (0.071022)*sailStates.beta + (1.647460)*sailStates.p + (-7.120185)*sailStates.q + (0.010064)*sailStates.r + (-0.000422)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end