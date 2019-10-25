function [aeroForces] = paramSpace_3_3_4_3_3_1_2(sailStates,airStates)

	CL = (4.252201)*sailStates.alpha + (0.022832)*sailStates.beta + (-2.554283)*sailStates.p + (34.185493)*sailStates.q + (-0.436035)*sailStates.r + (0.010839)*sailStates.de;
	CD = -0.170790;
	CY = (0.060957)*sailStates.alpha + (-0.025207)*sailStates.beta + (-0.290789)*sailStates.p + (0.498143)*sailStates.q + (0.019112)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.327285)*sailStates.alpha + (0.134764)*sailStates.beta + (-1.189268)*sailStates.p + (9.370933)*sailStates.q + (-0.453252)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-15.025442)*sailStates.alpha + (-0.066752)*sailStates.beta + (8.953798)*sailStates.p + (-137.428818)*sailStates.q + (1.439716)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.251042)*sailStates.alpha + (-0.007384)*sailStates.beta + (0.721652)*sailStates.p + (-4.001211)*sailStates.q + (-0.012806)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end