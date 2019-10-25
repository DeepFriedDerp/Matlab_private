function [aeroForces] = paramSpace_4_3_4_2_3_1_3(sailStates,airStates)

	CL = (4.116450)*sailStates.alpha + (0.002207)*sailStates.beta + (-2.811513)*sailStates.p + (34.931328)*sailStates.q + (-0.060623)*sailStates.r + (0.009985)*sailStates.de;
	CD = -0.344300;
	CY = (0.001142)*sailStates.alpha + (-0.025508)*sailStates.beta + (-0.297465)*sailStates.p + (0.455225)*sailStates.q + (0.059218)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.445497)*sailStates.alpha + (0.130463)*sailStates.beta + (-1.454237)*sailStates.p + (11.783932)*sailStates.q + (-0.269843)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-14.630855)*sailStates.alpha + (0.005866)*sailStates.beta + (10.334561)*sailStates.p + (-146.782669)*sailStates.q + (0.075254)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.211224)*sailStates.alpha + (-0.021915)*sailStates.beta + (0.938760)*sailStates.p + (-5.686346)*sailStates.q + (-0.075823)*sailStates.r + (-0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end