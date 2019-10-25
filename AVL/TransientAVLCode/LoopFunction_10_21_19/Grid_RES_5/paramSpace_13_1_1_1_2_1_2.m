function [aeroForces] = paramSpace_13_1_1_1_2_1_2(sailStates,airStates)

	CL = (4.668450)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.937613)*sailStates.p + (35.140648)*sailStates.q + (-0.499724)*sailStates.r + (0.010314)*sailStates.de;
	CD = -0.777510;
	CY = (-0.042543)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.521014)*sailStates.p + (0.624084)*sailStates.q + (0.091802)*sailStates.r + (0.000134)*sailStates.de;

	Cl = (1.685692)*sailStates.alpha + (0.235607)*sailStates.beta + (-1.569965)*sailStates.p + (12.647287)*sailStates.q + (-0.693857)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.634695)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.995234)*sailStates.p + (-150.579605)*sailStates.q + (1.623884)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (-0.044660)*sailStates.alpha + (-0.041544)*sailStates.beta + (1.396275)*sailStates.p + (-7.601737)*sailStates.q + (-0.075300)*sailStates.r + (-0.000277)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end