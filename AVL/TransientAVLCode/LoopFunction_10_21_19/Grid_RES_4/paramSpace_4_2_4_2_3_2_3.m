function [aeroForces] = paramSpace_4_2_4_2_3_2_3(sailStates,airStates)

	CL = (3.650074)*sailStates.alpha + (0.077290)*sailStates.beta + (-2.888680)*sailStates.p + (38.533649)*sailStates.q + (0.962301)*sailStates.r + (0.010703)*sailStates.de;
	CD = 0.114820;
	CY = (0.086831)*sailStates.alpha + (-0.024445)*sailStates.beta + (0.171222)*sailStates.p + (0.455226)*sailStates.q + (-0.034009)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.268778)*sailStates.alpha + (-0.080780)*sailStates.beta + (-1.510193)*sailStates.p + (13.131990)*sailStates.q + (0.684953)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-13.081310)*sailStates.alpha + (-0.309075)*sailStates.beta + (9.665812)*sailStates.p + (-146.782669)*sailStates.q + (-3.286775)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.360153)*sailStates.alpha + (0.018034)*sailStates.beta + (-0.121380)*sailStates.p + (-0.983868)*sailStates.q + (-0.052700)*sailStates.r + (-0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end