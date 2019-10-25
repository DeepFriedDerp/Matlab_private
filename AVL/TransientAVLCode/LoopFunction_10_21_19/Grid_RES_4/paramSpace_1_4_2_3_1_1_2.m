function [aeroForces] = paramSpace_1_4_2_3_1_1_2(sailStates,airStates)

	CL = (3.985513)*sailStates.alpha + (0.350669)*sailStates.beta + (-2.525278)*sailStates.p + (37.286331)*sailStates.q + (-1.519139)*sailStates.r + (0.010891)*sailStates.de;
	CD = -0.126570;
	CY = (-0.064266)*sailStates.alpha + (-0.026395)*sailStates.beta + (-0.452430)*sailStates.p + (-0.489619)*sailStates.q + (-0.089976)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.108655)*sailStates.alpha + (0.340121)*sailStates.beta + (-1.131655)*sailStates.p + (9.828041)*sailStates.q + (-1.184854)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-12.399930)*sailStates.alpha + (-1.330313)*sailStates.beta + (7.839713)*sailStates.p + (-134.519470)*sailStates.q + (5.082348)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.053108)*sailStates.alpha + (0.050437)*sailStates.beta + (0.851722)*sailStates.p + (-2.777029)*sailStates.q + (-0.021552)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end