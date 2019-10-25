function [aeroForces] = paramSpace_4_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.502272)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.120294)*sailStates.p + (34.080219)*sailStates.q + (-1.591997)*sailStates.r + (0.011392)*sailStates.de;
	CD = -0.583150;
	CY = (-0.048289)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.539544)*sailStates.p + (-1.241891)*sailStates.q + (-0.075960)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (0.919938)*sailStates.alpha + (0.319594)*sailStates.beta + (-0.813632)*sailStates.p + (6.796554)*sailStates.q + (-1.330538)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-12.572116)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.492131)*sailStates.p + (-123.350212)*sailStates.q + (5.332672)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (-0.478149)*sailStates.alpha + (0.044916)*sailStates.beta + (1.187042)*sailStates.p + (-4.342730)*sailStates.q + (-0.004125)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end