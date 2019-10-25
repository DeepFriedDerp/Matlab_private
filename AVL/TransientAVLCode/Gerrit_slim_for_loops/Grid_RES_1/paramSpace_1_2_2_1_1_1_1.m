function [aeroForces] = paramSpace_1_2_2_1_1_1_1(sailStates,airStates)

	CL = (7.502805)*sailStates.alpha + (-0.546660)*sailStates.beta + (-2.571410)*sailStates.p + (29.540373)*sailStates.q + (0.399688)*sailStates.r + (0.008884)*sailStates.de;
	CD = -4.655200;
	CY = (1.792369)*sailStates.alpha + (-0.005961)*sailStates.beta + (-0.152842)*sailStates.p + (14.596713)*sailStates.q + (-0.015987)*sailStates.r + (0.003109)*sailStates.de;

	Cl = (-1.832256)*sailStates.alpha + (-0.531402)*sailStates.beta + (-1.361894)*sailStates.p + (11.140095)*sailStates.q + (1.045785)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-12.807636)*sailStates.alpha + (2.654801)*sailStates.beta + (9.329002)*sailStates.p + (-138.146744)*sailStates.q + (-1.603849)*sailStates.r + (-0.068408)*sailStates.de;
	Cn = (-1.866427)*sailStates.alpha + (-0.074947)*sailStates.beta + (-0.227770)*sailStates.p + (-9.544946)*sailStates.q + (0.122586)*sailStates.r + (-0.004138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end