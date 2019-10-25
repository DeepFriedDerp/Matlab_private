function [aeroForces] = paramSpace_1_2_3_1_1_1_1(sailStates,airStates)

	CL = (5.362403)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.839572)*sailStates.p + (34.758476)*sailStates.q + (-2.379681)*sailStates.r + (0.011857)*sailStates.de;
	CD = -1.784700;
	CY = (0.005920)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.854629)*sailStates.p + (-2.260759)*sailStates.q + (-0.150909)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (0.559626)*sailStates.alpha + (0.517514)*sailStates.beta + (-0.545545)*sailStates.p + (4.942072)*sailStates.q + (-2.057449)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-9.382417)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.725606)*sailStates.p + (-113.665031)*sailStates.q + (7.924213)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (-1.377655)*sailStates.alpha + (0.091252)*sailStates.beta + (1.965216)*sailStates.p + (-7.219528)*sailStates.q + (0.000885)*sailStates.r + (0.000498)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end