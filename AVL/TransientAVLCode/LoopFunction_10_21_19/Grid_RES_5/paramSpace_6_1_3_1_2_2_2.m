function [aeroForces] = paramSpace_6_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.407917)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.031595)*sailStates.p + (37.556175)*sailStates.q + (0.604122)*sailStates.r + (0.010994)*sailStates.de;
	CD = -0.533620;
	CY = (0.210576)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.352314)*sailStates.p + (1.113126)*sailStates.q + (0.024675)*sailStates.r + (0.000242)*sailStates.de;

	Cl = (1.372345)*sailStates.alpha + (-0.221136)*sailStates.beta + (-1.607311)*sailStates.p + (13.252643)*sailStates.q + (0.700552)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.550169)*sailStates.alpha + (0.000000)*sailStates.beta + (10.642359)*sailStates.p + (-150.805054)*sailStates.q + (-2.073917)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (-0.232302)*sailStates.alpha + (-0.015463)*sailStates.beta + (-0.921646)*sailStates.p + (3.704082)*sailStates.q + (-0.007710)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end