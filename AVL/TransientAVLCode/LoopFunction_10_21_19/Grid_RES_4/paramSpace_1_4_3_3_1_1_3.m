function [aeroForces] = paramSpace_1_4_3_3_1_1_3(sailStates,airStates)

	CL = (3.971803)*sailStates.alpha + (0.343719)*sailStates.beta + (-2.776720)*sailStates.p + (39.374847)*sailStates.q + (-1.611273)*sailStates.r + (0.011106)*sailStates.de;
	CD = -0.129310;
	CY = (-0.091359)*sailStates.alpha + (-0.025694)*sailStates.beta + (-0.468982)*sailStates.p + (-0.294838)*sailStates.q + (-0.093297)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.197213)*sailStates.alpha + (0.349479)*sailStates.beta + (-1.337779)*sailStates.p + (11.807542)*sailStates.q + (-1.244029)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-12.488483)*sailStates.alpha + (-1.244849)*sailStates.beta + (8.659204)*sailStates.p + (-141.543854)*sailStates.q + (5.367669)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.263489)*sailStates.alpha + (0.050783)*sailStates.beta + (0.853674)*sailStates.p + (-2.816984)*sailStates.q + (-0.024725)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end