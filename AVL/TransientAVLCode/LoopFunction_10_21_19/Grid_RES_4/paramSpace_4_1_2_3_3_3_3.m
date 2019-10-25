function [aeroForces] = paramSpace_4_1_2_3_3_3_3(sailStates,airStates)

	CL = (3.971803)*sailStates.alpha + (0.343719)*sailStates.beta + (-2.776720)*sailStates.p + (39.374847)*sailStates.q + (1.611273)*sailStates.r + (0.011106)*sailStates.de;
	CD = -0.129310;
	CY = (0.091359)*sailStates.alpha + (-0.023878)*sailStates.beta + (0.468982)*sailStates.p + (0.294838)*sailStates.q + (-0.093297)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.317811)*sailStates.alpha + (-0.135061)*sailStates.beta + (-1.432168)*sailStates.p + (12.995420)*sailStates.q + (1.262761)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-12.488483)*sailStates.alpha + (-1.244849)*sailStates.beta + (8.659204)*sailStates.p + (-141.543869)*sailStates.q + (-5.367669)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.354294)*sailStates.alpha + (0.045598)*sailStates.beta + (-0.834898)*sailStates.p + (2.580700)*sailStates.q + (-0.028452)*sailStates.r + (0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end