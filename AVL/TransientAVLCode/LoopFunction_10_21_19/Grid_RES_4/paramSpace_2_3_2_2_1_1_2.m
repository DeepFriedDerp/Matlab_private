function [aeroForces] = paramSpace_2_3_2_2_1_1_2(sailStates,airStates)

	CL = (4.392910)*sailStates.alpha + (0.096225)*sailStates.beta + (-2.600611)*sailStates.p + (36.142475)*sailStates.q + (-1.146083)*sailStates.r + (0.011270)*sailStates.de;
	CD = -0.367020;
	CY = (-0.098195)*sailStates.alpha + (-0.025278)*sailStates.beta + (-0.435550)*sailStates.p + (-0.769435)*sailStates.q + (-0.028520)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.212079)*sailStates.alpha + (0.273496)*sailStates.beta + (-1.204803)*sailStates.p + (9.890450)*sailStates.q + (-1.019602)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-13.962927)*sailStates.alpha + (-0.384111)*sailStates.beta + (8.619102)*sailStates.p + (-137.556381)*sailStates.q + (3.905352)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.015622)*sailStates.alpha + (0.016290)*sailStates.beta + (0.929187)*sailStates.p + (-3.388231)*sailStates.q + (-0.000835)*sailStates.r + (0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end