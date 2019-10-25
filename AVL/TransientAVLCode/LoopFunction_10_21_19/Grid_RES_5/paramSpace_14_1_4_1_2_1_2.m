function [aeroForces] = paramSpace_14_1_4_1_2_1_2(sailStates,airStates)

	CL = (4.358054)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.882592)*sailStates.p + (34.597549)*sailStates.q + (-0.270904)*sailStates.r + (0.009737)*sailStates.de;
	CD = -0.638770;
	CY = (-0.031765)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.423155)*sailStates.p + (0.550479)*sailStates.q + (0.090004)*sailStates.r + (0.000118)*sailStates.de;

	Cl = (1.603048)*sailStates.alpha + (0.189773)*sailStates.beta + (-1.543930)*sailStates.p + (12.486571)*sailStates.q + (-0.476112)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-14.893025)*sailStates.alpha + (0.000000)*sailStates.beta + (10.896715)*sailStates.p + (-149.810104)*sailStates.q + (0.737167)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (-0.130927)*sailStates.alpha + (-0.040338)*sailStates.beta + (1.262346)*sailStates.p + (-7.391649)*sailStates.q + (-0.097675)*sailStates.r + (-0.000287)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end