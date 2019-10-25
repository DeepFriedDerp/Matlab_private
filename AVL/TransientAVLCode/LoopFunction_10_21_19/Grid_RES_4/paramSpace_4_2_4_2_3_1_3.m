function [aeroForces] = paramSpace_4_2_4_2_3_1_3(sailStates,airStates)

	CL = (4.116450)*sailStates.alpha + (-0.002207)*sailStates.beta + (-2.811512)*sailStates.p + (34.931332)*sailStates.q + (-0.060623)*sailStates.r + (0.009985)*sailStates.de;
	CD = -0.344300;
	CY = (0.001142)*sailStates.alpha + (-0.024445)*sailStates.beta + (-0.297465)*sailStates.p + (0.455225)*sailStates.q + (0.059218)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.490419)*sailStates.alpha + (0.131057)*sailStates.beta + (-1.485770)*sailStates.p + (12.180902)*sailStates.q + (-0.263528)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-14.630855)*sailStates.alpha + (-0.005866)*sailStates.beta + (10.334560)*sailStates.p + (-146.782669)*sailStates.q + (0.075254)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.208311)*sailStates.alpha + (-0.030104)*sailStates.beta + (0.945033)*sailStates.p + (-5.765308)*sailStates.q + (-0.077079)*sailStates.r + (-0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end