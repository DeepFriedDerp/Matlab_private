function [aeroForces] = paramSpace_3_4_3_2_1_1_3(sailStates,airStates)

	CL = (4.180824)*sailStates.alpha + (0.120289)*sailStates.beta + (-2.915114)*sailStates.p + (36.804604)*sailStates.q + (-0.419751)*sailStates.r + (0.010813)*sailStates.de;
	CD = -0.301490;
	CY = (-0.148366)*sailStates.alpha + (-0.023766)*sailStates.beta + (-0.253617)*sailStates.p + (-0.870358)*sailStates.q + (0.016592)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.278211)*sailStates.alpha + (0.187093)*sailStates.beta + (-1.465338)*sailStates.p + (11.851673)*sailStates.q + (-0.501085)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.380233)*sailStates.alpha + (-0.484050)*sailStates.beta + (10.166759)*sailStates.p + (-146.834106)*sailStates.q + (1.424055)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.088608)*sailStates.alpha + (-0.009758)*sailStates.beta + (0.688068)*sailStates.p + (-2.834311)*sailStates.q + (-0.005931)*sailStates.r + (0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end