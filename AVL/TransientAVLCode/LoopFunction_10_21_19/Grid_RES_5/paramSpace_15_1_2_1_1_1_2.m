function [aeroForces] = paramSpace_15_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.022928)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.756572)*sailStates.p + (34.220951)*sailStates.q + (0.388193)*sailStates.r + (0.009586)*sailStates.de;
	CD = -0.355500;
	CY = (-0.191357)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.099947)*sailStates.p + (-1.423508)*sailStates.q + (0.024971)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (1.296592)*sailStates.alpha + (0.105926)*sailStates.beta + (-1.473434)*sailStates.p + (12.448190)*sailStates.q + (0.015073)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-14.597033)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.997890)*sailStates.p + (-145.460434)*sailStates.q + (-1.384972)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.057752)*sailStates.alpha + (-0.026410)*sailStates.beta + (0.596536)*sailStates.p + (-2.874414)*sailStates.q + (-0.061031)*sailStates.r + (0.000355)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end