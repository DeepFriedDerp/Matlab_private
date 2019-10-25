function [aeroForces] = paramSpace_14_1_1_2_1_1_2(sailStates,airStates)

	CL = (3.924063)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.619315)*sailStates.p + (35.074860)*sailStates.q + (0.683059)*sailStates.r + (0.010430)*sailStates.de;
	CD = -0.002230;
	CY = (-0.065761)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.056126)*sailStates.p + (-0.571906)*sailStates.q + (-0.011868)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.270593)*sailStates.alpha + (-0.005398)*sailStates.beta + (-1.304708)*sailStates.p + (11.045180)*sailStates.q + (0.337685)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-14.505155)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.996982)*sailStates.p + (-139.762878)*sailStates.q + (-2.288036)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (-0.156874)*sailStates.alpha + (0.001147)*sailStates.beta + (0.114377)*sailStates.p + (-0.870082)*sailStates.q + (-0.037557)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end