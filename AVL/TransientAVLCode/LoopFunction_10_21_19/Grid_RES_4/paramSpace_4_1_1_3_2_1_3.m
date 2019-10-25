function [aeroForces] = paramSpace_4_1_1_3_2_1_3(sailStates,airStates)

	CL = (3.919616)*sailStates.alpha + (0.033572)*sailStates.beta + (-2.663211)*sailStates.p + (34.748497)*sailStates.q + (0.405172)*sailStates.r + (0.010270)*sailStates.de;
	CD = -0.080950;
	CY = (-0.031697)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.073734)*sailStates.p + (-0.194782)*sailStates.q + (0.014687)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.348954)*sailStates.alpha + (0.074148)*sailStates.beta + (-1.391987)*sailStates.p + (11.788783)*sailStates.q + (0.115425)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-14.496902)*sailStates.alpha + (0.003356)*sailStates.beta + (9.366493)*sailStates.p + (-140.845245)*sailStates.q + (-1.373776)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.194538)*sailStates.alpha + (-0.015437)*sailStates.beta + (0.401711)*sailStates.p + (-2.499691)*sailStates.q + (-0.048146)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end