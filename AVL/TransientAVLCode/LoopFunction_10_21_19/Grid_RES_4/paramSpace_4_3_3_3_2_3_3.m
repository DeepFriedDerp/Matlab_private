function [aeroForces] = paramSpace_4_3_3_3_2_3_3(sailStates,airStates)

	CL = (4.133101)*sailStates.alpha + (-0.128216)*sailStates.beta + (-2.780350)*sailStates.p + (39.772667)*sailStates.q + (1.753064)*sailStates.r + (0.011180)*sailStates.de;
	CD = -0.183360;
	CY = (0.036751)*sailStates.alpha + (-0.024762)*sailStates.beta + (0.562954)*sailStates.p + (-0.194783)*sailStates.q + (-0.111985)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.366508)*sailStates.alpha + (-0.312313)*sailStates.beta + (-1.368690)*sailStates.p + (12.306106)*sailStates.q + (1.381928)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-12.618451)*sailStates.alpha + (0.481485)*sailStates.beta + (8.543527)*sailStates.p + (-141.871536)*sailStates.q + (-5.848970)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.247147)*sailStates.alpha + (0.054537)*sailStates.beta + (-1.035744)*sailStates.p + (3.868622)*sailStates.q + (-0.014734)*sailStates.r + (0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end