function [aeroForces] = paramSpace_2_4_2_1_2_2_2(sailStates,airStates)

	CL = (3.988793)*sailStates.alpha + (0.079849)*sailStates.beta + (-2.547005)*sailStates.p + (34.711102)*sailStates.q + (-0.335327)*sailStates.r + (0.010858)*sailStates.de;
	CD = 0.032720;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.082465)*sailStates.p + (0.000000)*sailStates.q + (-0.005405)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.162169)*sailStates.alpha + (0.061894)*sailStates.beta + (-1.149937)*sailStates.p + (9.108215)*sailStates.q + (-0.235625)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.434391)*sailStates.alpha + (-0.318902)*sailStates.beta + (8.688341)*sailStates.p + (-136.150452)*sailStates.q + (1.146872)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.031111)*sailStates.alpha + (0.003001)*sailStates.beta + (0.115191)*sailStates.p + (-0.275815)*sailStates.q + (-0.002983)*sailStates.r + (-0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end