function [aeroForces] = paramSpace_3_4_1_3_1_1_1(sailStates,airStates)

	CL = (4.099447)*sailStates.alpha + (0.101672)*sailStates.beta + (-2.265180)*sailStates.p + (31.816528)*sailStates.q + (-0.237955)*sailStates.r + (0.010640)*sailStates.de;
	CD = -0.121390;
	CY = (-0.032971)*sailStates.alpha + (-0.024461)*sailStates.beta + (-0.185490)*sailStates.p + (-0.432842)*sailStates.q + (0.012203)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.005646)*sailStates.alpha + (0.126159)*sailStates.beta + (-0.929071)*sailStates.p + (6.936547)*sailStates.q + (-0.343632)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.713986)*sailStates.alpha + (-0.503751)*sailStates.beta + (7.913693)*sailStates.p + (-128.769608)*sailStates.q + (0.841310)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.173482)*sailStates.alpha + (-0.006423)*sailStates.beta + (0.463186)*sailStates.p + (-1.791641)*sailStates.q + (-0.004216)*sailStates.r + (0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end