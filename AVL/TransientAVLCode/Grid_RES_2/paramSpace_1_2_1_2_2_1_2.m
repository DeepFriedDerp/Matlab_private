function [aeroForces] = paramSpace_1_2_1_2_2_1_2(sailStates,airStates)

	CL = (7.683870)*sailStates.alpha + (-0.527744)*sailStates.beta + (-2.571835)*sailStates.p + (29.400637)*sailStates.q + (0.413338)*sailStates.r + (0.008680)*sailStates.de;
	CD = -4.946680;
	CY = (1.865560)*sailStates.alpha + (0.001252)*sailStates.beta + (-0.191070)*sailStates.p + (15.231751)*sailStates.q + (-0.022997)*sailStates.r + (0.003244)*sailStates.de;

	Cl = (-1.956770)*sailStates.alpha + (-0.537055)*sailStates.beta + (-1.370073)*sailStates.p + (11.225485)*sailStates.q + (1.046021)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-12.425045)*sailStates.alpha + (2.486632)*sailStates.beta + (9.340188)*sailStates.p + (-138.225098)*sailStates.q + (-1.615401)*sailStates.r + (-0.068416)*sailStates.de;
	Cn = (-1.947730)*sailStates.alpha + (-0.084949)*sailStates.beta + (-0.185292)*sailStates.p + (-10.028293)*sailStates.q + (0.133058)*sailStates.r + (-0.004296)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end