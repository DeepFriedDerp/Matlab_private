function [aeroForces] = paramSpace_2_3_1_3_3_1_2(sailStates,airStates)

	CL = (4.395812)*sailStates.alpha + (0.090980)*sailStates.beta + (-2.578305)*sailStates.p + (35.802261)*sailStates.q + (-1.129251)*sailStates.r + (0.011152)*sailStates.de;
	CD = -0.245940;
	CY = (0.063705)*sailStates.alpha + (-0.024746)*sailStates.beta + (-0.486928)*sailStates.p + (0.498143)*sailStates.q + (-0.031968)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.398113)*sailStates.alpha + (0.247633)*sailStates.beta + (-1.193800)*sailStates.p + (9.800672)*sailStates.q + (-0.980330)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.434766)*sailStates.alpha + (-0.373300)*sailStates.beta + (8.549509)*sailStates.p + (-136.960373)*sailStates.q + (3.852253)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.165817)*sailStates.alpha + (0.014082)*sailStates.beta + (0.993753)*sailStates.p + (-4.526883)*sailStates.q + (0.005783)*sailStates.r + (-0.000208)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end