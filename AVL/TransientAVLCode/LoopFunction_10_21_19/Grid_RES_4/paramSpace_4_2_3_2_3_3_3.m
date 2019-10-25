function [aeroForces] = paramSpace_4_2_3_2_3_3_3(sailStates,airStates)

	CL = (4.151511)*sailStates.alpha + (0.149813)*sailStates.beta + (-2.966673)*sailStates.p + (42.086979)*sailStates.q + (1.976087)*sailStates.r + (0.011511)*sailStates.de;
	CD = -0.365290;
	CY = (0.170002)*sailStates.alpha + (-0.024476)*sailStates.beta + (0.625324)*sailStates.p + (0.455227)*sailStates.q + (-0.124368)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.298690)*sailStates.alpha + (-0.285740)*sailStates.beta + (-1.534998)*sailStates.p + (14.080872)*sailStates.q + (1.609608)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-11.738157)*sailStates.alpha + (-0.567565)*sailStates.beta + (9.007627)*sailStates.p + (-146.782669)*sailStates.q + (-6.595694)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.552231)*sailStates.alpha + (0.064818)*sailStates.beta + (-1.165751)*sailStates.p + (3.786482)*sailStates.q + (-0.027623)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end