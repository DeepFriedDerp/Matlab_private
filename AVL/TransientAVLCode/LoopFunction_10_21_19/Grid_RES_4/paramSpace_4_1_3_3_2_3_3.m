function [aeroForces] = paramSpace_4_1_3_3_2_3_3(sailStates,airStates)

	CL = (4.073816)*sailStates.alpha + (0.382026)*sailStates.beta + (-2.761477)*sailStates.p + (39.503963)*sailStates.q + (1.745525)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.183670;
	CY = (0.036745)*sailStates.alpha + (-0.025426)*sailStates.beta + (0.561212)*sailStates.p + (-0.194783)*sailStates.q + (-0.111639)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.427226)*sailStates.alpha + (-0.152210)*sailStates.beta + (-1.422795)*sailStates.p + (13.023127)*sailStates.q + (1.389234)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-12.419475)*sailStates.alpha + (-1.434649)*sailStates.beta + (8.481376)*sailStates.p + (-140.845245)*sailStates.q + (-5.823565)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.310827)*sailStates.alpha + (0.052904)*sailStates.beta + (-1.020791)*sailStates.p + (3.705774)*sailStates.q + (-0.017021)*sailStates.r + (0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end