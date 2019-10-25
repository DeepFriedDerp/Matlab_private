function [aeroForces] = paramSpace_4_3_3_1_1_3_1(sailStates,airStates)

	CL = (7.448835)*sailStates.alpha + (-0.251018)*sailStates.beta + (-1.748556)*sailStates.p + (36.247639)*sailStates.q + (3.325298)*sailStates.r + (0.011751)*sailStates.de;
	CD = -3.004980;
	CY = (-0.693724)*sailStates.alpha + (-0.023875)*sailStates.beta + (1.420081)*sailStates.p + (-1.002333)*sailStates.q + (-0.282508)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (2.305736)*sailStates.alpha + (-0.738115)*sailStates.beta + (-0.470841)*sailStates.p + (5.153398)*sailStates.q + (2.843112)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-10.319496)*sailStates.alpha + (0.949291)*sailStates.beta + (3.372891)*sailStates.p + (-108.591927)*sailStates.q + (-10.972949)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (2.673664)*sailStates.alpha + (0.127807)*sailStates.beta + (-3.148046)*sailStates.p + (14.868332)*sailStates.q + (0.079279)*sailStates.r + (0.000480)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end