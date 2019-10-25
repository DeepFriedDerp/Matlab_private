function [aeroForces] = paramSpace_3_2_3_2_2_2_1(sailStates,airStates)

	CL = (3.992541)*sailStates.alpha + (0.024435)*sailStates.beta + (-2.164354)*sailStates.p + (31.718609)*sailStates.q + (0.284793)*sailStates.r + (0.010839)*sailStates.de;
	CD = 0.031990;
	CY = (0.001472)*sailStates.alpha + (-0.024937)*sailStates.beta + (0.066728)*sailStates.p + (0.100924)*sailStates.q + (-0.004370)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.051310)*sailStates.alpha + (-0.031760)*sailStates.beta + (-0.895750)*sailStates.p + (6.940057)*sailStates.q + (0.198467)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.490124)*sailStates.alpha + (-0.098997)*sailStates.beta + (7.412418)*sailStates.p + (-126.149185)*sailStates.q + (-0.976911)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.002442)*sailStates.alpha + (0.002346)*sailStates.beta + (-0.099768)*sailStates.p + (0.197933)*sailStates.q + (-0.002655)*sailStates.r + (-0.000027)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end