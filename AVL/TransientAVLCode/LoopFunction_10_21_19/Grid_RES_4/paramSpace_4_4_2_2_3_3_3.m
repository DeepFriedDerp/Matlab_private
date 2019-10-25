function [aeroForces] = paramSpace_4_4_2_2_3_3_3(sailStates,airStates)

	CL = (4.120810)*sailStates.alpha + (-0.425593)*sailStates.beta + (-2.948650)*sailStates.p + (41.769672)*sailStates.q + (1.959348)*sailStates.r + (0.011432)*sailStates.de;
	CD = -0.365250;
	CY = (0.166758)*sailStates.alpha + (-0.026188)*sailStates.beta + (0.609107)*sailStates.p + (0.455226)*sailStates.q + (-0.121175)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.210361)*sailStates.alpha + (-0.449465)*sailStates.beta + (-1.463570)*sailStates.p + (13.210854)*sailStates.q + (1.568172)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-11.746367)*sailStates.alpha + (1.559424)*sailStates.beta + (8.955963)*sailStates.p + (-145.756409)*sailStates.q + (-6.517549)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.467669)*sailStates.alpha + (0.065599)*sailStates.beta + (-1.154017)*sailStates.p + (3.927879)*sailStates.q + (-0.024469)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end