function [aeroForces] = paramSpace_4_3_1_3_2_3_1(sailStates,airStates)

	CL = (4.211658)*sailStates.alpha + (-0.104898)*sailStates.beta + (-2.280391)*sailStates.p + (35.401886)*sailStates.q + (1.534477)*sailStates.r + (0.011105)*sailStates.de;
	CD = -0.184040;
	CY = (-0.026862)*sailStates.alpha + (-0.025163)*sailStates.beta + (0.472186)*sailStates.p + (0.194783)*sailStates.q + (-0.093944)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.142914)*sailStates.alpha + (-0.275765)*sailStates.beta + (-0.957827)*sailStates.p + (8.338250)*sailStates.q + (1.170006)*sailStates.r + (-0.000040)*sailStates.de;
	Cm = (-13.002649)*sailStates.alpha + (0.361919)*sailStates.beta + (6.943393)*sailStates.p + (-127.822792)*sailStates.q + (-5.083042)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.221194)*sailStates.alpha + (0.048345)*sailStates.beta + (-0.944972)*sailStates.p + (3.744140)*sailStates.q + (-0.007094)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end