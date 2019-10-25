function [aeroForces] = paramSpace_4_3_3_2_3_1_3(sailStates,airStates)

	CL = (4.175949)*sailStates.alpha + (0.008963)*sailStates.beta + (-2.812298)*sailStates.p + (34.882336)*sailStates.q + (-0.069551)*sailStates.r + (0.010074)*sailStates.de;
	CD = -0.376220;
	CY = (-0.001378)*sailStates.alpha + (-0.025476)*sailStates.beta + (-0.312050)*sailStates.p + (0.455225)*sailStates.q + (0.062087)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.451649)*sailStates.alpha + (0.138113)*sailStates.beta + (-1.454616)*sailStates.p + (11.781726)*sailStates.q + (-0.293652)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-14.837246)*sailStates.alpha + (-0.038853)*sailStates.beta + (10.345126)*sailStates.p + (-146.782669)*sailStates.q + (0.128365)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.203544)*sailStates.alpha + (-0.023503)*sailStates.beta + (0.960789)*sailStates.p + (-5.697433)*sailStates.q + (-0.075186)*sailStates.r + (-0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end