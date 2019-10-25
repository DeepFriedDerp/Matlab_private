function [aeroForces] = paramSpace_13_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.108449)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.884535)*sailStates.p + (35.554935)*sailStates.q + (0.023891)*sailStates.r + (0.010061)*sailStates.de;
	CD = -0.376310;
	CY = (-0.192516)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.169187)*sailStates.p + (-1.304045)*sailStates.q + (0.029693)*sailStates.r + (-0.000280)*sailStates.de;

	Cl = (1.343482)*sailStates.alpha + (0.136599)*sailStates.beta + (-1.537236)*sailStates.p + (12.742626)*sailStates.q + (-0.214982)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-14.436040)*sailStates.alpha + (0.000000)*sailStates.beta + (10.378849)*sailStates.p + (-148.140839)*sailStates.q + (-0.153523)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.028199)*sailStates.alpha + (-0.024086)*sailStates.beta + (0.685078)*sailStates.p + (-3.194928)*sailStates.q + (-0.035109)*sailStates.r + (0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end