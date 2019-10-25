function [aeroForces] = paramSpace_4_2_2_1_3_3_2(sailStates,airStates)

	CL = (5.523618)*sailStates.alpha + (0.220071)*sailStates.beta + (-2.699646)*sailStates.p + (42.915688)*sailStates.q + (2.807929)*sailStates.r + (0.012262)*sailStates.de;
	CD = -1.835140;
	CY = (0.239836)*sailStates.alpha + (-0.023264)*sailStates.beta + (0.981945)*sailStates.p + (1.664520)*sailStates.q + (-0.195381)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.125302)*sailStates.alpha + (-0.495423)*sailStates.beta + (-1.263375)*sailStates.p + (12.111696)*sailStates.q + (2.407455)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-9.651584)*sailStates.alpha + (-0.827773)*sailStates.beta + (7.273896)*sailStates.p + (-137.222183)*sailStates.q + (-9.316120)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.165215)*sailStates.alpha + (0.110607)*sailStates.beta + (-2.084520)*sailStates.p + (7.376960)*sailStates.q + (-0.014162)*sailStates.r + (-0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end