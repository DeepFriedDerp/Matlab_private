function [aeroForces] = paramSpace_4_1_2_1_2_1_2(sailStates,airStates)

	CL = (5.247771)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.081944)*sailStates.p + (42.696774)*sailStates.q + (-2.394515)*sailStates.r + (0.011756)*sailStates.de;
	CD = -1.037000;
	CY = (-0.036225)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.967456)*sailStates.p + (1.241891)*sailStates.q + (-0.136011)*sailStates.r + (0.000268)*sailStates.de;

	Cl = (2.025989)*sailStates.alpha + (0.433918)*sailStates.beta + (-1.609287)*sailStates.p + (14.624382)*sailStates.q + (-2.020579)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-13.297582)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.308572)*sailStates.p + (-149.211060)*sailStates.q + (8.026776)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (0.534845)*sailStates.alpha + (0.060983)*sailStates.beta + (1.942551)*sailStates.p + (-8.888729)*sailStates.q + (0.020837)*sailStates.r + (-0.000529)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end