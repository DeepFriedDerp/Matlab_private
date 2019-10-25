function [aeroForces] = paramSpace_2_4_1_2_1_1_1(sailStates,airStates)

	CL = (4.271549)*sailStates.alpha + (0.301250)*sailStates.beta + (-2.178688)*sailStates.p + (32.633930)*sailStates.q + (-1.098475)*sailStates.r + (0.010884)*sailStates.de;
	CD = -0.365830;
	CY = (-0.037771)*sailStates.alpha + (-0.025991)*sailStates.beta + (-0.433305)*sailStates.p + (-0.870358)*sailStates.q + (-0.028308)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (0.908504)*sailStates.alpha + (0.318220)*sailStates.beta + (-0.834432)*sailStates.p + (6.365518)*sailStates.q + (-0.995708)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-13.497873)*sailStates.alpha + (-1.257054)*sailStates.beta + (7.206881)*sailStates.p + (-125.466835)*sailStates.q + (3.764168)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.360792)*sailStates.alpha + (0.016446)*sailStates.beta + (0.940267)*sailStates.p + (-3.397522)*sailStates.q + (-0.000495)*sailStates.r + (0.000189)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end