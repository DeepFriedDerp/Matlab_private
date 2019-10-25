function [aeroForces] = paramSpace_1_1_3_2_1_3_3(sailStates,airStates)

	CL = (4.295662)*sailStates.alpha + (0.080267)*sailStates.beta + (-2.828682)*sailStates.p + (34.920654)*sailStates.q + (0.213369)*sailStates.r + (0.010274)*sailStates.de;
	CD = -0.443040;
	CY = (0.006969)*sailStates.alpha + (-0.023714)*sailStates.beta + (0.371535)*sailStates.p + (-0.491416)*sailStates.q + (0.065465)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.562816)*sailStates.alpha + (-0.156354)*sailStates.beta + (-1.520658)*sailStates.p + (12.526805)*sailStates.q + (0.417848)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-15.118254)*sailStates.alpha + (-0.406861)*sailStates.beta + (10.371938)*sailStates.p + (-146.474228)*sailStates.q + (-0.674806)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.144692)*sailStates.alpha + (-0.037790)*sailStates.beta + (-1.053779)*sailStates.p + (5.956313)*sailStates.q + (-0.065058)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end