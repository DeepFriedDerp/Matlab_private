function [aeroForces] = paramSpace_1_2_4_2_1_2_3(sailStates,airStates)

	CL = (3.773422)*sailStates.alpha + (-0.056346)*sailStates.beta + (-2.891177)*sailStates.p + (38.386688)*sailStates.q + (-0.934821)*sailStates.r + (0.010971)*sailStates.de;
	CD = 0.077320;
	CY = (-0.079272)*sailStates.alpha + (-0.024539)*sailStates.beta + (-0.127467)*sailStates.p + (-0.455226)*sailStates.q + (-0.025404)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.285842)*sailStates.alpha + (0.060143)*sailStates.beta + (-1.511372)*sailStates.p + (13.125374)*sailStates.q + (-0.613317)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-13.700483)*sailStates.alpha + (0.174917)*sailStates.beta + (9.697504)*sailStates.p + (-146.782669)*sailStates.q + (3.127445)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.334258)*sailStates.alpha + (0.014004)*sailStates.beta + (0.055414)*sailStates.p + (1.017133)*sailStates.q + (-0.051402)*sailStates.r + (0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end