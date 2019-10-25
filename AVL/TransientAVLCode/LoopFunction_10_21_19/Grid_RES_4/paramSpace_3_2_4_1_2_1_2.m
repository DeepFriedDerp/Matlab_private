function [aeroForces] = paramSpace_3_2_4_1_2_1_2(sailStates,airStates)

	CL = (6.149940)*sailStates.alpha + (-0.139186)*sailStates.beta + (-2.508322)*sailStates.p + (32.334675)*sailStates.q + (-1.875571)*sailStates.r + (0.010459)*sailStates.de;
	CD = -2.144810;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.951917)*sailStates.p + (0.000000)*sailStates.q + (0.062392)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.834266)*sailStates.alpha + (0.434678)*sailStates.beta + (-1.205838)*sailStates.p + (9.287591)*sailStates.q + (-1.813296)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.607471)*sailStates.alpha + (0.525997)*sailStates.beta + (9.245317)*sailStates.p + (-137.194580)*sailStates.q + (6.325596)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.463762)*sailStates.alpha + (-0.032553)*sailStates.beta + (2.223750)*sailStates.p + (-10.475366)*sailStates.q + (-0.021900)*sailStates.r + (-0.000206)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end