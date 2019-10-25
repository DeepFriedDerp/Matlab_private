function [aeroForces] = paramSpace_1_4_2_3_2_2_3(sailStates,airStates)

	CL = (3.757742)*sailStates.alpha + (0.228420)*sailStates.beta + (-2.711567)*sailStates.p + (37.174694)*sailStates.q + (-1.084168)*sailStates.r + (0.010555)*sailStates.de;
	CD = 0.079330;
	CY = (-0.004137)*sailStates.alpha + (-0.024146)*sailStates.beta + (-0.258157)*sailStates.p + (0.194783)*sailStates.q + (-0.051358)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.206787)*sailStates.alpha + (0.191617)*sailStates.beta + (-1.312631)*sailStates.p + (11.220269)*sailStates.q + (-0.757127)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-13.259346)*sailStates.alpha + (-0.847974)*sailStates.beta + (8.913791)*sailStates.p + (-140.845245)*sailStates.q + (3.649669)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.190856)*sailStates.alpha + (0.027048)*sailStates.beta + (0.350021)*sailStates.p + (-0.850370)*sailStates.q + (-0.029060)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end