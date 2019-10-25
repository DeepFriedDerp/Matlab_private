function [aeroForces] = paramSpace_2_1_1_2_2_2_1(sailStates,airStates)

	CL = (3.786914)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.207121)*sailStates.p + (31.707628)*sailStates.q + (-0.531656)*sailStates.r + (0.009951)*sailStates.de;
	CD = 0.039510;
	CY = (0.032477)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.045175)*sailStates.p + (0.230434)*sailStates.q + (-0.009627)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.082692)*sailStates.alpha + (0.013460)*sailStates.beta + (-0.966805)*sailStates.p + (7.790166)*sailStates.q + (-0.263412)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-13.942562)*sailStates.alpha + (0.000000)*sailStates.beta + (7.649299)*sailStates.p + (-128.239044)*sailStates.q + (1.847122)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (0.143902)*sailStates.alpha + (0.002861)*sailStates.beta + (-0.090772)*sailStates.p + (0.925862)*sailStates.q + (-0.031810)*sailStates.r + (-0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end