function [aeroForces] = paramSpace_1_2_2_2_1_2_2(sailStates,airStates)

	CL = (7.605186)*sailStates.alpha + (-0.511601)*sailStates.beta + (-2.555530)*sailStates.p + (29.690538)*sailStates.q + (0.189481)*sailStates.r + (0.008908)*sailStates.de;
	CD = -4.444930;
	CY = (1.860346)*sailStates.alpha + (-0.005225)*sailStates.beta + (-0.274070)*sailStates.p + (15.167809)*sailStates.q + (-0.031785)*sailStates.r + (0.003229)*sailStates.de;

	Cl = (-1.585674)*sailStates.alpha + (-0.480365)*sailStates.beta + (-1.349529)*sailStates.p + (11.140907)*sailStates.q + (0.866617)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.687103)*sailStates.alpha + (2.528751)*sailStates.beta + (9.144155)*sailStates.p + (-137.392548)*sailStates.q + (-0.906714)*sailStates.r + (-0.068331)*sailStates.de;
	Cn = (-1.916391)*sailStates.alpha + (-0.071161)*sailStates.beta + (0.029867)*sailStates.p + (-11.141662)*sailStates.q + (0.132472)*sailStates.r + (-0.004319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end