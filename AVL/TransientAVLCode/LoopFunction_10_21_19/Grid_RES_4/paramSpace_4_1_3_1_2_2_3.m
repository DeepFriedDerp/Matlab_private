function [aeroForces] = paramSpace_4_1_3_1_2_2_3(sailStates,airStates)

	CL = (3.444610)*sailStates.alpha + (0.261838)*sailStates.beta + (-3.313021)*sailStates.p + (42.302689)*sailStates.q + (1.326685)*sailStates.r + (0.010877)*sailStates.de;
	CD = 0.095000;
	CY = (0.041261)*sailStates.alpha + (-0.026962)*sailStates.beta + (0.332509)*sailStates.p + (-0.662188)*sailStates.q + (-0.066164)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.347946)*sailStates.alpha + (-0.040289)*sailStates.beta + (-1.900750)*sailStates.p + (17.163475)*sailStates.q + (0.974356)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-12.252553)*sailStates.alpha + (-0.960595)*sailStates.beta + (10.855793)*sailStates.p + (-157.701111)*sailStates.q + (-4.457304)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-0.556048)*sailStates.alpha + (0.022775)*sailStates.beta + (-0.388141)*sailStates.p + (0.736451)*sailStates.q + (-0.041393)*sailStates.r + (0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end