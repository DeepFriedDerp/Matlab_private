function [aeroForces] = paramSpace_1_2_3_2_3_3_1(sailStates,airStates)

	CL = (4.023944)*sailStates.alpha + (0.012097)*sailStates.beta + (-1.993487)*sailStates.p + (28.477571)*sailStates.q + (0.002537)*sailStates.r + (0.009783)*sailStates.de;
	CD = -0.252370;
	CY = (0.022572)*sailStates.alpha + (-0.025445)*sailStates.beta + (0.181837)*sailStates.p + (0.455227)*sailStates.q + (0.036186)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (0.969379)*sailStates.alpha + (-0.107412)*sailStates.beta + (-0.822674)*sailStates.p + (6.129697)*sailStates.q + (0.248281)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-14.816583)*sailStates.alpha + (-0.072012)*sailStates.beta + (7.334547)*sailStates.p + (-122.911674)*sailStates.q + (0.036668)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.319066)*sailStates.alpha + (-0.022973)*sailStates.beta + (-0.554914)*sailStates.p + (2.503817)*sailStates.q + (-0.028517)*sailStates.r + (-0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end