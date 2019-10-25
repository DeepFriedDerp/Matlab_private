function [aeroForces] = paramSpace_4_3_3_2_3_3_3(sailStates,airStates)

	CL = (4.151510)*sailStates.alpha + (-0.149813)*sailStates.beta + (-2.966674)*sailStates.p + (42.086979)*sailStates.q + (1.976087)*sailStates.r + (0.011511)*sailStates.de;
	CD = -0.365290;
	CY = (0.170002)*sailStates.alpha + (-0.025476)*sailStates.beta + (0.625324)*sailStates.p + (0.455227)*sailStates.q + (-0.124368)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.261647)*sailStates.alpha + (-0.374684)*sailStates.beta + (-1.503460)*sailStates.p + (13.683902)*sailStates.q + (1.603320)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-11.738157)*sailStates.alpha + (0.567565)*sailStates.beta + (9.007627)*sailStates.p + (-146.782669)*sailStates.q + (-6.595693)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.514868)*sailStates.alpha + (0.066549)*sailStates.beta + (-1.172024)*sailStates.p + (3.865444)*sailStates.q + (-0.026372)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end