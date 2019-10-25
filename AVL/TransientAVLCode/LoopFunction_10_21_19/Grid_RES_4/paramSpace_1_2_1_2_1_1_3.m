function [aeroForces] = paramSpace_1_2_1_2_1_1_3(sailStates,airStates)

	CL = (4.116372)*sailStates.alpha + (-0.156787)*sailStates.beta + (-2.965847)*sailStates.p + (42.135971)*sailStates.q + (-1.985224)*sailStates.r + (0.011422)*sailStates.de;
	CD = -0.358740;
	CY = (-0.172521)*sailStates.alpha + (-0.024445)*sailStates.beta + (-0.639909)*sailStates.p + (-0.455223)*sailStates.q + (-0.127237)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.293381)*sailStates.alpha + (0.292617)*sailStates.beta + (-1.534615)*sailStates.p + (14.083078)*sailStates.q + (-1.633434)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-11.531766)*sailStates.alpha + (0.612284)*sailStates.beta + (8.997063)*sailStates.p + (-146.782669)*sailStates.q + (6.648804)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.560976)*sailStates.alpha + (0.066172)*sailStates.beta + (1.187793)*sailStates.p + (-3.797575)*sailStates.q + (-0.028321)*sailStates.r + (0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end