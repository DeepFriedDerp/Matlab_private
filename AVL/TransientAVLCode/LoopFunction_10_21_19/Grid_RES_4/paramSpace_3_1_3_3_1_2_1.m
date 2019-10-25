function [aeroForces] = paramSpace_3_1_3_3_1_2_1(sailStates,airStates)

	CL = (3.993982)*sailStates.alpha + (0.093139)*sailStates.beta + (-2.281769)*sailStates.p + (32.630157)*sailStates.q + (0.431077)*sailStates.r + (0.010736)*sailStates.de;
	CD = 0.023090;
	CY = (-0.070433)*sailStates.alpha + (-0.025294)*sailStates.beta + (0.152407)*sailStates.p + (-0.432842)*sailStates.q + (-0.010005)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.203608)*sailStates.alpha + (-0.030668)*sailStates.beta + (-1.031930)*sailStates.p + (8.352787)*sailStates.q + (0.320351)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.389717)*sailStates.alpha + (-0.364194)*sailStates.beta + (7.762494)*sailStates.p + (-128.769608)*sailStates.q + (-1.465544)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.090144)*sailStates.alpha + (0.004239)*sailStates.beta + (-0.266397)*sailStates.p + (1.297764)*sailStates.q + (0.000890)*sailStates.r + (0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end