function [aeroForces] = paramSpace_1_4_4_3_2_3_3(sailStates,airStates)

	CL = (3.919616)*sailStates.alpha + (0.033572)*sailStates.beta + (-2.663211)*sailStates.p + (34.748497)*sailStates.q + (-0.405172)*sailStates.r + (0.010270)*sailStates.de;
	CD = -0.080950;
	CY = (0.031697)*sailStates.alpha + (-0.024227)*sailStates.beta + (0.073734)*sailStates.p + (0.194782)*sailStates.q + (0.014687)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.211876)*sailStates.alpha + (-0.017713)*sailStates.beta + (-1.297581)*sailStates.p + (10.600901)*sailStates.q + (-0.096775)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-14.496901)*sailStates.alpha + (0.003356)*sailStates.beta + (9.366493)*sailStates.p + (-140.845245)*sailStates.q + (1.373776)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.179377)*sailStates.alpha + (-0.002835)*sailStates.beta + (-0.382933)*sailStates.p + (2.263407)*sailStates.q + (-0.044436)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end