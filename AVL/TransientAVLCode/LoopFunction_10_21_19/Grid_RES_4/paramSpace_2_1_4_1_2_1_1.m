function [aeroForces] = paramSpace_2_1_4_1_2_1_1(sailStates,airStates)

	CL = (6.099803)*sailStates.alpha + (-0.539232)*sailStates.beta + (-1.720655)*sailStates.p + (30.169960)*sailStates.q + (-2.425846)*sailStates.r + (0.011052)*sailStates.de;
	CD = -2.275520;
	CY = (0.362899)*sailStates.alpha + (-0.024620)*sailStates.beta + (-1.067200)*sailStates.p + (-0.221995)*sailStates.q + (-0.069971)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.329999)*sailStates.alpha + (0.381328)*sailStates.beta + (-0.543469)*sailStates.p + (4.310925)*sailStates.q + (-2.179782)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-12.420749)*sailStates.alpha + (2.028625)*sailStates.beta + (5.246983)*sailStates.p + (-111.854546)*sailStates.q + (8.202605)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-1.921513)*sailStates.alpha + (0.038202)*sailStates.beta + (2.396836)*sailStates.p + (-10.825877)*sailStates.q + (0.016425)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end