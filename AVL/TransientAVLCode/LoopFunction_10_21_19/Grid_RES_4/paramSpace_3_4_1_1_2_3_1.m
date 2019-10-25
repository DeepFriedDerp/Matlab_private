function [aeroForces] = paramSpace_3_4_1_1_2_3_1(sailStates,airStates)

	CL = (6.099803)*sailStates.alpha + (-0.539232)*sailStates.beta + (-1.720655)*sailStates.p + (30.169960)*sailStates.q + (2.425846)*sailStates.r + (0.011052)*sailStates.de;
	CD = -2.275520;
	CY = (-0.362899)*sailStates.alpha + (-0.024953)*sailStates.beta + (1.067200)*sailStates.p + (0.221995)*sailStates.q + (-0.069971)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.153920)*sailStates.alpha + (-0.693629)*sailStates.beta + (-0.445765)*sailStates.p + (3.102364)*sailStates.q + (2.173506)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-12.420749)*sailStates.alpha + (2.028624)*sailStates.beta + (5.246982)*sailStates.p + (-111.854546)*sailStates.q + (-8.202607)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (2.075303)*sailStates.alpha + (0.032254)*sailStates.beta + (-2.403240)*sailStates.p + (10.905089)*sailStates.q + (0.016836)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end