function [aeroForces] = paramSpace_4_2_1_2_3_1_3(sailStates,airStates)

	CL = (4.276333)*sailStates.alpha + (-0.022823)*sailStates.beta + (-2.813948)*sailStates.p + (34.784363)*sailStates.q + (-0.087789)*sailStates.r + (0.010253)*sailStates.de;
	CD = -0.419840;
	CY = (-0.006418)*sailStates.alpha + (-0.024539)*sailStates.beta + (-0.341220)*sailStates.p + (0.455225)*sailStates.q + (0.067824)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.509129)*sailStates.alpha + (0.151709)*sailStates.beta + (-1.486952)*sailStates.p + (12.174286)*sailStates.q + (-0.335181)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-15.250028)*sailStates.alpha + (0.128292)*sailStates.beta + (10.366254)*sailStates.p + (-146.782669)*sailStates.q + (0.234585)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.183096)*sailStates.alpha + (-0.034059)*sailStates.beta + (1.010982)*sailStates.p + (-5.798572)*sailStates.q + (-0.075865)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end