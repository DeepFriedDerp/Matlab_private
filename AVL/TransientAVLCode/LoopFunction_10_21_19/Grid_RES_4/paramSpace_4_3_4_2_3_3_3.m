function [aeroForces] = paramSpace_4_3_4_2_3_3_3(sailStates,airStates)

	CL = (4.116371)*sailStates.alpha + (-0.156787)*sailStates.beta + (-2.965847)*sailStates.p + (42.135971)*sailStates.q + (1.985224)*sailStates.r + (0.011422)*sailStates.de;
	CD = -0.358740;
	CY = (0.172521)*sailStates.alpha + (-0.025508)*sailStates.beta + (0.639909)*sailStates.p + (0.455223)*sailStates.q + (-0.127237)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.256591)*sailStates.alpha + (-0.382345)*sailStates.beta + (-1.503082)*sailStates.p + (13.686108)*sailStates.q + (1.627119)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-11.531766)*sailStates.alpha + (0.612284)*sailStates.beta + (8.997063)*sailStates.p + (-146.782669)*sailStates.q + (-6.648804)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.523002)*sailStates.alpha + (0.068086)*sailStates.beta + (-1.194065)*sailStates.p + (3.876537)*sailStates.q + (-0.027065)*sailStates.r + (-0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end