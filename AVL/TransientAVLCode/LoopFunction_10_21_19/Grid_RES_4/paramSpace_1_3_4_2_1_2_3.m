function [aeroForces] = paramSpace_1_3_4_2_1_2_3(sailStates,airStates)

	CL = (3.773421)*sailStates.alpha + (0.056346)*sailStates.beta + (-2.891177)*sailStates.p + (38.386688)*sailStates.q + (-0.934821)*sailStates.r + (0.010971)*sailStates.de;
	CD = 0.077320;
	CY = (-0.079272)*sailStates.alpha + (-0.025413)*sailStates.beta + (-0.127467)*sailStates.p + (-0.455226)*sailStates.q + (-0.025404)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.244226)*sailStates.alpha + (0.102966)*sailStates.beta + (-1.479823)*sailStates.p + (12.728403)*sailStates.q + (-0.607084)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-13.700483)*sailStates.alpha + (-0.174917)*sailStates.beta + (9.697506)*sailStates.p + (-146.782669)*sailStates.q + (3.127444)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.318560)*sailStates.alpha + (0.018440)*sailStates.beta + (0.061690)*sailStates.p + (0.938171)*sailStates.q + (-0.050162)*sailStates.r + (0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end