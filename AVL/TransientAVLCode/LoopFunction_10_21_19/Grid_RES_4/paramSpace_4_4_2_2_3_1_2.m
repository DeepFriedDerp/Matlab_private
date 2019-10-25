function [aeroForces] = paramSpace_4_4_2_2_3_1_2(sailStates,airStates)

	CL = (4.272853)*sailStates.alpha + (0.070211)*sailStates.beta + (-2.406741)*sailStates.p + (31.262539)*sailStates.q + (-0.241675)*sailStates.r + (0.009813)*sailStates.de;
	CD = -0.427090;
	CY = (0.085813)*sailStates.alpha + (-0.027114)*sailStates.beta + (-0.376055)*sailStates.p + (0.756269)*sailStates.q + (0.074775)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.286110)*sailStates.alpha + (0.174806)*sailStates.beta + (-1.096682)*sailStates.p + (8.245875)*sailStates.q + (-0.456255)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-15.286079)*sailStates.alpha + (-0.326690)*sailStates.beta + (9.041899)*sailStates.p + (-134.899979)*sailStates.q + (0.722844)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.439833)*sailStates.alpha + (-0.020689)*sailStates.beta + (1.015270)*sailStates.p + (-5.713902)*sailStates.q + (-0.067813)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end