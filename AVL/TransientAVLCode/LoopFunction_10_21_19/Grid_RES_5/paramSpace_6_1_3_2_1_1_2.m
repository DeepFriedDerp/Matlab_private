function [aeroForces] = paramSpace_6_1_3_2_1_1_2(sailStates,airStates)

	CL = (4.145044)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.800963)*sailStates.p + (37.394646)*sailStates.q + (-0.811603)*sailStates.r + (0.011316)*sailStates.de;
	CD = -0.086180;
	CY = (-0.068611)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.269936)*sailStates.p + (-0.351849)*sailStates.q + (-0.018888)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.330791)*sailStates.alpha + (0.149185)*sailStates.beta + (-1.390679)*sailStates.p + (11.593574)*sailStates.q + (-0.671602)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.320875)*sailStates.alpha + (0.000000)*sailStates.beta + (9.393179)*sailStates.p + (-143.366257)*sailStates.q + (2.743186)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (0.120880)*sailStates.alpha + (0.010432)*sailStates.beta + (0.538128)*sailStates.p + (-1.925898)*sailStates.q + (-0.002540)*sailStates.r + (0.000045)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end