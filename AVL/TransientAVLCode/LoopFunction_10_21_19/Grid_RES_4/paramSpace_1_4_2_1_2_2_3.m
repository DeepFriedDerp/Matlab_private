function [aeroForces] = paramSpace_1_4_2_1_2_2_3(sailStates,airStates)

	CL = (3.444610)*sailStates.alpha + (0.261838)*sailStates.beta + (-3.313021)*sailStates.p + (42.302696)*sailStates.q + (-1.326685)*sailStates.r + (0.010877)*sailStates.de;
	CD = 0.095000;
	CY = (-0.041261)*sailStates.alpha + (-0.022610)*sailStates.beta + (-0.332509)*sailStates.p + (0.662188)*sailStates.q + (-0.066164)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.245559)*sailStates.alpha + (0.233313)*sailStates.beta + (-1.806377)*sailStates.p + (15.975595)*sailStates.q + (-0.955541)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-12.252554)*sailStates.alpha + (-0.960595)*sailStates.beta + (10.855795)*sailStates.p + (-157.701080)*sailStates.q + (4.457304)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.497703)*sailStates.alpha + (0.031648)*sailStates.beta + (0.406913)*sailStates.p + (-0.972734)*sailStates.q + (-0.037651)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end