function [aeroForces] = paramSpace_1_3_2_1_2_2_1(sailStates,airStates)

	CL = (3.586312)*sailStates.alpha + (0.124971)*sailStates.beta + (-1.626001)*sailStates.p + (27.762091)*sailStates.q + (-0.568692)*sailStates.r + (0.010220)*sailStates.de;
	CD = 0.047610;
	CY = (-0.034402)*sailStates.alpha + (-0.026316)*sailStates.beta + (-0.102930)*sailStates.p + (-0.589407)*sailStates.q + (-0.018149)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.486287)*sailStates.alpha + (0.097732)*sailStates.beta + (-0.419465)*sailStates.p + (2.560927)*sailStates.q + (-0.342626)*sailStates.r + (-0.000892)*sailStates.de;
	Cm = (-12.862890)*sailStates.alpha + (-0.459594)*sailStates.beta + (5.460881)*sailStates.p + (-110.634644)*sailStates.q + (1.925852)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-0.134018)*sailStates.alpha + (0.014156)*sailStates.beta + (0.208275)*sailStates.p + (-0.543479)*sailStates.q + (-0.010648)*sailStates.r + (0.000159)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end