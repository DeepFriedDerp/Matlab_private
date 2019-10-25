function [aeroForces] = paramSpace_4_4_3_2_2_1_3(sailStates,airStates)

	CL = (3.993179)*sailStates.alpha + (0.001542)*sailStates.beta + (-2.771115)*sailStates.p + (34.738178)*sailStates.q + (0.116484)*sailStates.r + (0.009913)*sailStates.de;
	CD = -0.274000;
	CY = (-0.068738)*sailStates.alpha + (-0.023797)*sailStates.beta + (-0.193626)*sailStates.p + (-0.301043)*sailStates.q + (0.038504)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.285360)*sailStates.alpha + (0.097908)*sailStates.beta + (-1.400459)*sailStates.p + (11.350269)*sailStates.q + (-0.146252)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-14.378188)*sailStates.alpha + (-0.033742)*sailStates.beta + (10.024036)*sailStates.p + (-144.677322)*sailStates.q + (-0.471251)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.141442)*sailStates.alpha + (-0.013503)*sailStates.beta + (0.703451)*sailStates.p + (-3.903250)*sailStates.q + (-0.055420)*sailStates.r + (0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end