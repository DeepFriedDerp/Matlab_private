function [aeroForces] = paramSpace_2_1_4_1_1_2_2(sailStates,airStates)

	CL = (4.536114)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.885260)*sailStates.p + (34.440876)*sailStates.q + (0.298399)*sailStates.r + (0.010024)*sailStates.de;
	CD = -0.727170;
	CY = (0.041387)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.466815)*sailStates.p + (-0.550481)*sailStates.q + (0.099165)*sailStates.r + (-0.000118)*sailStates.de;

	Cl = (1.625899)*sailStates.alpha + (-0.211592)*sailStates.beta + (-1.545212)*sailStates.p + (12.479548)*sailStates.q + (0.547877)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-15.555279)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.931171)*sailStates.p + (-149.810104)*sailStates.q + (-0.899269)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (0.101200)*sailStates.alpha + (-0.044975)*sailStates.beta + (-1.328361)*sailStates.p + (7.424688)*sailStates.q + (-0.096357)*sailStates.r + (0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end