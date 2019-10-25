function [aeroForces] = paramSpace_1_3_4_2_1_3_3(sailStates,airStates)

	CL = (4.276333)*sailStates.alpha + (-0.022823)*sailStates.beta + (-2.813948)*sailStates.p + (34.784363)*sailStates.q + (0.087789)*sailStates.r + (0.010253)*sailStates.de;
	CD = -0.419840;
	CY = (0.006418)*sailStates.alpha + (-0.025413)*sailStates.beta + (0.341220)*sailStates.p + (-0.455225)*sailStates.q + (0.067824)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.463446)*sailStates.alpha + (-0.153422)*sailStates.beta + (-1.455403)*sailStates.p + (11.777315)*sailStates.q + (0.341413)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-15.250027)*sailStates.alpha + (0.128292)*sailStates.beta + (10.366255)*sailStates.p + (-146.782669)*sailStates.q + (-0.234585)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.187842)*sailStates.alpha + (-0.026636)*sailStates.beta + (-1.004706)*sailStates.p + (5.719610)*sailStates.q + (-0.074625)*sailStates.r + (0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end