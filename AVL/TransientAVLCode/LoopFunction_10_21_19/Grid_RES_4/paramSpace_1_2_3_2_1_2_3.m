function [aeroForces] = paramSpace_1_2_3_2_1_2_3(sailStates,airStates)

	CL = (3.738508)*sailStates.alpha + (-0.063444)*sailStates.beta + (-2.890319)*sailStates.p + (38.435669)*sailStates.q + (-0.944108)*sailStates.r + (0.010882)*sailStates.de;
	CD = 0.083080;
	CY = (-0.081792)*sailStates.alpha + (-0.024508)*sailStates.beta + (-0.142052)*sailStates.p + (-0.455226)*sailStates.q + (-0.028272)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.280323)*sailStates.alpha + (0.067019)*sailStates.beta + (-1.510969)*sailStates.p + (13.127579)*sailStates.q + (-0.637243)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-13.494092)*sailStates.alpha + (0.219636)*sailStates.beta + (9.686940)*sailStates.p + (-146.782669)*sailStates.q + (3.180555)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.343003)*sailStates.alpha + (0.015362)*sailStates.beta + (0.077356)*sailStates.p + (1.006044)*sailStates.q + (-0.051597)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end