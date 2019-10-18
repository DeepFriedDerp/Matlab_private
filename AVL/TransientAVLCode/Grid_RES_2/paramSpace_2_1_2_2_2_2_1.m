function [aeroForces] = paramSpace_2_1_2_2_2_2_1(sailStates,airStates)

	CL = (6.019880)*sailStates.alpha + (-2.024992)*sailStates.beta + (-3.718309)*sailStates.p + (51.070362)*sailStates.q + (2.284414)*sailStates.r + (0.012782)*sailStates.de;
	CD = -6.108740;
	CY = (1.998513)*sailStates.alpha + (-0.135627)*sailStates.beta + (0.322869)*sailStates.p + (15.622974)*sailStates.q + (-0.034761)*sailStates.r + (0.003310)*sailStates.de;

	Cl = (-5.278776)*sailStates.alpha + (-1.070626)*sailStates.beta + (-1.890729)*sailStates.p + (16.398495)*sailStates.q + (2.510136)*sailStates.r + (0.001650)*sailStates.de;
	Cm = (3.691815)*sailStates.alpha + (9.071595)*sailStates.beta + (11.623444)*sailStates.p + (-165.405823)*sailStates.q + (-8.069318)*sailStates.r + (-0.068344)*sailStates.de;
	Cn = (-2.272525)*sailStates.alpha + (0.227750)*sailStates.beta + (-0.917389)*sailStates.p + (-8.890359)*sailStates.q + (-0.195769)*sailStates.r + (-0.004322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end