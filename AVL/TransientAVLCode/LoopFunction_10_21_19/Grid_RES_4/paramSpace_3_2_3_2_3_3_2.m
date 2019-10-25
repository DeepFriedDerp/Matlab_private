function [aeroForces] = paramSpace_3_2_3_2_3_3_2(sailStates,airStates)

	CL = (4.392910)*sailStates.alpha + (0.096225)*sailStates.beta + (-2.600611)*sailStates.p + (36.142475)*sailStates.q + (1.146083)*sailStates.r + (0.011270)*sailStates.de;
	CD = -0.367020;
	CY = (0.098195)*sailStates.alpha + (-0.024675)*sailStates.beta + (0.435550)*sailStates.p + (0.769435)*sailStates.q + (-0.028520)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.260776)*sailStates.alpha + (-0.223619)*sailStates.beta + (-1.237451)*sailStates.p + (10.294326)*sailStates.q + (1.021756)*sailStates.r + (0.000405)*sailStates.de;
	Cm = (-13.962926)*sailStates.alpha + (-0.384111)*sailStates.beta + (8.619103)*sailStates.p + (-137.556381)*sailStates.q + (-3.905352)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.009374)*sailStates.alpha + (0.016293)*sailStates.beta + (-0.927047)*sailStates.p + (3.361759)*sailStates.q + (-0.000976)*sailStates.r + (-0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end