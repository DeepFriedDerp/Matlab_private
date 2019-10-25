function [aeroForces] = paramSpace_1_1_1_2_3_3_2(sailStates,airStates)

	CL = (4.010744)*sailStates.alpha + (0.000136)*sailStates.beta + (-2.395970)*sailStates.p + (31.966551)*sailStates.q + (-0.061452)*sailStates.r + (0.009864)*sailStates.de;
	CD = -0.206090;
	CY = (0.090603)*sailStates.alpha + (-0.026932)*sailStates.beta + (0.133164)*sailStates.p + (0.759371)*sailStates.q + (0.023408)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.251142)*sailStates.alpha + (-0.100912)*sailStates.beta + (-1.174342)*sailStates.p + (9.542968)*sailStates.q + (0.148186)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-14.525136)*sailStates.alpha + (0.012993)*sailStates.beta + (8.612485)*sailStates.p + (-133.652283)*sailStates.q + (0.269670)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (0.169235)*sailStates.alpha + (-0.020313)*sailStates.beta + (-0.519933)*sailStates.p + (2.552271)*sailStates.q + (-0.029101)*sailStates.r + (-0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end