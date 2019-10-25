function [aeroForces] = paramSpace_1_2_1_1_1_2_2(sailStates,airStates)

	CL = (7.327849)*sailStates.alpha + (-0.387782)*sailStates.beta + (-2.531146)*sailStates.p + (30.269917)*sailStates.q + (-0.156518)*sailStates.r + (0.008951)*sailStates.de;
	CD = -3.614170;
	CY = (1.834291)*sailStates.alpha + (0.000792)*sailStates.beta + (-0.451474)*sailStates.p + (14.962717)*sailStates.q + (-0.057318)*sailStates.r + (0.003183)*sailStates.de;

	Cl = (-0.701551)*sailStates.alpha + (-0.360509)*sailStates.beta + (-1.319085)*sailStates.p + (11.019185)*sailStates.q + (0.505455)*sailStates.r + (0.000252)*sailStates.de;
	Cm = (-15.139483)*sailStates.alpha + (1.935969)*sailStates.beta + (8.846202)*sailStates.p + (-136.263718)*sailStates.q + (0.298307)*sailStates.r + (-0.068217)*sailStates.de;
	Cn = (-1.819507)*sailStates.alpha + (-0.067962)*sailStates.beta + (0.418693)*sailStates.p + (-12.597922)*sailStates.q + (0.140620)*sailStates.r + (-0.004269)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end