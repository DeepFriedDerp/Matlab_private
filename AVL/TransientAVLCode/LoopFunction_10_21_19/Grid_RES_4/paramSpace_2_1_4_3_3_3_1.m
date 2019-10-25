function [aeroForces] = paramSpace_2_1_4_3_3_3_1(sailStates,airStates)

	CL = (4.099447)*sailStates.alpha + (0.101672)*sailStates.beta + (-2.265180)*sailStates.p + (31.816528)*sailStates.q + (0.237955)*sailStates.r + (0.010640)*sailStates.de;
	CD = -0.121390;
	CY = (0.032971)*sailStates.alpha + (-0.025111)*sailStates.beta + (0.185490)*sailStates.p + (0.432842)*sailStates.q + (0.012203)*sailStates.r + (0.000092)*sailStates.de;

	Cl = (1.168005)*sailStates.alpha + (-0.093344)*sailStates.beta + (-1.026775)*sailStates.p + (8.145105)*sailStates.q + (0.337356)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.713986)*sailStates.alpha + (-0.503751)*sailStates.beta + (7.913693)*sailStates.p + (-128.769608)*sailStates.q + (-0.841310)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.155221)*sailStates.alpha + (-0.007964)*sailStates.beta + (-0.469590)*sailStates.p + (1.870854)*sailStates.q + (-0.004628)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end