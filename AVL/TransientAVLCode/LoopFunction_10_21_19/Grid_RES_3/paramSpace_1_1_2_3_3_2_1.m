function [aeroForces] = paramSpace_1_1_2_3_3_2_1(sailStates,airStates)

	CL = (3.905543)*sailStates.alpha + (-0.166999)*sailStates.beta + (-2.219918)*sailStates.p + (32.945911)*sailStates.q + (-0.911100)*sailStates.r + (0.010483)*sailStates.de;
	CD = 0.039020;
	CY = (0.067914)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.247755)*sailStates.p + (0.318253)*sailStates.q + (-0.043686)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.179652)*sailStates.alpha + (0.059039)*sailStates.beta + (-0.993622)*sailStates.p + (8.394873)*sailStates.q + (-0.637911)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-13.700553)*sailStates.alpha + (0.600406)*sailStates.beta + (7.286886)*sailStates.p + (-126.937798)*sailStates.q + (3.056702)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.061464)*sailStates.alpha + (0.019033)*sailStates.beta + (0.408008)*sailStates.p + (-1.580931)*sailStates.q + (-0.009645)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end