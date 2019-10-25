function [aeroForces] = paramSpace_3_3_3_1_2_1_1(sailStates,airStates)

	CL = (5.895811)*sailStates.alpha + (0.151686)*sailStates.beta + (-1.623903)*sailStates.p + (25.150154)*sailStates.q + (-2.001015)*sailStates.r + (0.010104)*sailStates.de;
	CD = -2.207710;
	CY = (0.394507)*sailStates.alpha + (-0.025063)*sailStates.beta + (-1.002898)*sailStates.p + (0.221996)*sailStates.q + (0.065741)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.122431)*sailStates.alpha + (0.537073)*sailStates.beta + (-0.450619)*sailStates.p + (2.176557)*sailStates.q + (-1.934641)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-14.901521)*sailStates.alpha + (-0.590340)*sailStates.beta + (6.295507)*sailStates.p + (-112.898659)*sailStates.q + (6.769398)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-2.033538)*sailStates.alpha + (-0.031002)*sailStates.beta + (2.270156)*sailStates.p + (-10.519534)*sailStates.q + (-0.020063)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end