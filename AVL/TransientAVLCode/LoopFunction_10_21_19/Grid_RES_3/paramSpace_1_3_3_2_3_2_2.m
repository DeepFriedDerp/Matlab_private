function [aeroForces] = paramSpace_1_3_3_2_3_2_2(sailStates,airStates)

	CL = (4.012882)*sailStates.alpha + (0.161621)*sailStates.beta + (-2.466614)*sailStates.p + (35.057831)*sailStates.q + (-1.058594)*sailStates.r + (0.010706)*sailStates.de;
	CD = 0.020750;
	CY = (0.097487)*sailStates.alpha + (-0.023105)*sailStates.beta + (-0.298833)*sailStates.p + (0.759371)*sailStates.q + (-0.052620)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.219820)*sailStates.alpha + (0.177935)*sailStates.beta + (-1.112368)*sailStates.p + (9.323374)*sailStates.q + (-0.721825)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-14.047892)*sailStates.alpha + (-0.508160)*sailStates.beta + (8.040117)*sailStates.p + (-133.652283)*sailStates.q + (3.515733)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.053023)*sailStates.alpha + (0.020438)*sailStates.beta + (0.504493)*sailStates.p + (-2.405914)*sailStates.q + (-0.004074)*sailStates.r + (-0.000268)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end