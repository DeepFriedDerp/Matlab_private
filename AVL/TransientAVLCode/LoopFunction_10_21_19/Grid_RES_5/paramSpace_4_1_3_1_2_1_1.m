function [aeroForces] = paramSpace_4_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.245674)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.078635)*sailStates.p + (34.342823)*sailStates.q + (-2.102040)*sailStates.r + (0.011323)*sailStates.de;
	CD = -1.003190;
	CY = (0.281732)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.865279)*sailStates.p + (0.696927)*sailStates.q + (-0.121582)*sailStates.r + (0.000148)*sailStates.de;

	Cl = (1.541759)*sailStates.alpha + (0.404684)*sailStates.beta + (-0.787759)*sailStates.p + (6.870243)*sailStates.q + (-1.764822)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-13.126471)*sailStates.alpha + (0.000000)*sailStates.beta + (6.012101)*sailStates.p + (-121.395615)*sailStates.q + (7.029997)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (-1.038575)*sailStates.alpha + (0.056875)*sailStates.beta + (1.855364)*sailStates.p + (-8.733174)*sailStates.q + (0.028234)*sailStates.r + (-0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end