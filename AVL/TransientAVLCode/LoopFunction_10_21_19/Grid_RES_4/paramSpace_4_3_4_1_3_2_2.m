function [aeroForces] = paramSpace_4_3_4_1_3_2_2(sailStates,airStates)

	CL = (3.757073)*sailStates.alpha + (-0.059234)*sailStates.beta + (-2.528190)*sailStates.p + (35.080952)*sailStates.q + (0.573101)*sailStates.r + (0.010512)*sailStates.de;
	CD = 0.083540;
	CY = (0.202249)*sailStates.alpha + (-0.026920)*sailStates.beta + (-0.021057)*sailStates.p + (1.664522)*sailStates.q + (0.004367)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.125205)*sailStates.alpha + (-0.067637)*sailStates.beta + (-1.177369)*sailStates.p + (9.624928)*sailStates.q + (0.359674)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-13.624483)*sailStates.alpha + (0.248937)*sailStates.beta + (8.726660)*sailStates.p + (-137.222183)*sailStates.q + (-2.012584)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.383817)*sailStates.alpha + (0.014807)*sailStates.beta + (0.213578)*sailStates.p + (-3.050193)*sailStates.q + (-0.067984)*sailStates.r + (-0.000503)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end