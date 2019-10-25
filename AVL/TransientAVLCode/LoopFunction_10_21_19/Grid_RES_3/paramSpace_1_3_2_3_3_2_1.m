function [aeroForces] = paramSpace_1_3_2_3_3_2_1(sailStates,airStates)

	CL = (3.905543)*sailStates.alpha + (0.166999)*sailStates.beta + (-2.219918)*sailStates.p + (32.945911)*sailStates.q + (-0.911100)*sailStates.r + (0.010483)*sailStates.de;
	CD = 0.039020;
	CY = (0.067914)*sailStates.alpha + (-0.024029)*sailStates.beta + (-0.247755)*sailStates.p + (0.318253)*sailStates.q + (-0.043686)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.044607)*sailStates.alpha + (0.159150)*sailStates.beta + (-0.908987)*sailStates.p + (7.334006)*sailStates.q + (-0.622988)*sailStates.r + (-0.000142)*sailStates.de;
	Cm = (-13.700553)*sailStates.alpha + (-0.600406)*sailStates.beta + (7.286886)*sailStates.p + (-126.937798)*sailStates.q + (3.056702)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.111894)*sailStates.alpha + (0.019439)*sailStates.beta + (0.422931)*sailStates.p + (-1.767991)*sailStates.q + (-0.007014)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end