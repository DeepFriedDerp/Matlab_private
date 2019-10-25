function [aeroForces] = paramSpace_2_4_1_2_3_3_3(sailStates,airStates)

	CL = (4.148532)*sailStates.alpha + (-0.098876)*sailStates.beta + (-2.914838)*sailStates.p + (36.821171)*sailStates.q + (0.410535)*sailStates.r + (0.010783)*sailStates.de;
	CD = -0.277790;
	CY = (0.145874)*sailStates.alpha + (-0.023582)*sailStates.beta + (0.238658)*sailStates.p + (0.870359)*sailStates.q + (0.015551)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.280819)*sailStates.alpha + (-0.178623)*sailStates.beta + (-1.465208)*sailStates.p + (11.852421)*sailStates.q + (0.477007)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.316946)*sailStates.alpha + (0.346723)*sailStates.beta + (10.163216)*sailStates.p + (-146.834106)*sailStates.q + (-1.369990)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.080662)*sailStates.alpha + (-0.009375)*sailStates.beta + (-0.665956)*sailStates.p + (2.822908)*sailStates.q + (-0.006188)*sailStates.r + (-0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end