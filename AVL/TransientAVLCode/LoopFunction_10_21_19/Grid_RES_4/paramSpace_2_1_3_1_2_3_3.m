function [aeroForces] = paramSpace_2_1_3_1_2_3_3(sailStates,airStates)

	CL = (5.836808)*sailStates.alpha + (0.443846)*sailStates.beta + (-3.374007)*sailStates.p + (39.203121)*sailStates.q + (1.779955)*sailStates.r + (0.010808)*sailStates.de;
	CD = -2.194560;
	CY = (0.373729)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.946607)*sailStates.p + (0.221994)*sailStates.q + (0.062052)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.976517)*sailStates.alpha + (-0.365152)*sailStates.beta + (-1.952135)*sailStates.p + (16.320351)*sailStates.q + (1.766346)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-14.129253)*sailStates.alpha + (-1.797192)*sailStates.beta + (12.138996)*sailStates.p + (-160.446365)*sailStates.q + (-6.050763)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.078168)*sailStates.alpha + (-0.035227)*sailStates.beta + (-2.244745)*sailStates.p + (10.467362)*sailStates.q + (-0.023047)*sailStates.r + (0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end