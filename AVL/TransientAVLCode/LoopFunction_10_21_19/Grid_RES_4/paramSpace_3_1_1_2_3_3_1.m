function [aeroForces] = paramSpace_3_1_1_2_3_3_1(sailStates,airStates)

	CL = (4.276777)*sailStates.alpha + (0.237109)*sailStates.beta + (-2.179314)*sailStates.p + (32.584896)*sailStates.q + (1.074162)*sailStates.r + (0.010973)*sailStates.de;
	CD = -0.340720;
	CY = (0.045182)*sailStates.alpha + (-0.024133)*sailStates.beta + (0.389032)*sailStates.p + (0.870359)*sailStates.q + (-0.025590)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.079238)*sailStates.alpha + (-0.158360)*sailStates.beta + (-0.932451)*sailStates.p + (7.571799)*sailStates.q + (0.931818)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-13.712879)*sailStates.alpha + (-0.851454)*sailStates.beta + (7.215998)*sailStates.p + (-125.466835)*sailStates.q + (-3.625063)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.268066)*sailStates.alpha + (0.015304)*sailStates.beta + (-0.868459)*sailStates.p + (3.283562)*sailStates.q + (-0.000242)*sailStates.r + (-0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end