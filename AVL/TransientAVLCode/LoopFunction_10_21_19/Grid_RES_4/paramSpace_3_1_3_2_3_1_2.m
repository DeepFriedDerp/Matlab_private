function [aeroForces] = paramSpace_3_1_3_2_3_1_2(sailStates,airStates)

	CL = (4.596582)*sailStates.alpha + (-0.183361)*sailStates.beta + (-2.528418)*sailStates.p + (33.460953)*sailStates.q + (-0.874798)*sailStates.r + (0.010618)*sailStates.de;
	CD = -0.526350;
	CY = (0.092268)*sailStates.alpha + (-0.023884)*sailStates.beta + (-0.518774)*sailStates.p + (0.769436)*sailStates.q + (0.034029)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.580578)*sailStates.alpha + (0.169800)*sailStates.beta + (-1.244120)*sailStates.p + (9.984487)*sailStates.q + (-0.866283)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-15.231869)*sailStates.alpha + (0.699266)*sailStates.beta + (9.000857)*sailStates.p + (-136.512222)*sailStates.q + (2.944555)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.332255)*sailStates.alpha + (-0.018076)*sailStates.beta + (1.217378)*sailStates.p + (-6.395776)*sailStates.q + (-0.017722)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end