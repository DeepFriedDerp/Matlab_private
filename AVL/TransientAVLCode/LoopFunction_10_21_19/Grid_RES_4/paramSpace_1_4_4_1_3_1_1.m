function [aeroForces] = paramSpace_1_4_4_1_3_1_1(sailStates,airStates)

	CL = (7.400506)*sailStates.alpha + (0.707486)*sailStates.beta + (-1.730677)*sailStates.p + (35.884094)*sailStates.q + (-3.303246)*sailStates.r + (0.011749)*sailStates.de;
	CD = -2.964690;
	CY = (0.681361)*sailStates.alpha + (-0.021908)*sailStates.beta + (-1.390163)*sailStates.p + (1.002331)*sailStates.q + (-0.276413)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (2.218288)*sailStates.alpha + (0.854067)*sailStates.beta + (-0.431084)*sailStates.p + (4.678031)*sailStates.q + (-2.786656)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-10.516994)*sailStates.alpha + (-2.576359)*sailStates.beta + (3.326338)*sailStates.p + (-107.565659)*sailStates.q + (10.869106)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-2.708873)*sailStates.alpha + (0.114189)*sailStates.beta + (3.109453)*sailStates.p + (-14.919118)*sailStates.q + (0.080924)*sailStates.r + (-0.000482)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end