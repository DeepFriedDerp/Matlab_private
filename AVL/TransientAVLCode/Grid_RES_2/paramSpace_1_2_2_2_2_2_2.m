function [aeroForces] = paramSpace_1_2_2_2_2_2_2(sailStates,airStates)

	CL = (8.166255)*sailStates.alpha + (-0.584970)*sailStates.beta + (-2.568892)*sailStates.p + (29.138153)*sailStates.q + (0.393764)*sailStates.r + (0.008704)*sailStates.de;
	CD = -5.432970;
	CY = (1.988119)*sailStates.alpha + (-0.003879)*sailStates.beta + (-0.216309)*sailStates.p + (16.211271)*sailStates.q + (-0.023885)*sailStates.r + (0.003453)*sailStates.de;

	Cl = (-2.347504)*sailStates.alpha + (-0.563702)*sailStates.beta + (-1.376910)*sailStates.p + (11.323474)*sailStates.q + (1.088993)*sailStates.r + (0.000337)*sailStates.de;
	Cm = (-12.499714)*sailStates.alpha + (2.835271)*sailStates.beta + (9.317586)*sailStates.p + (-138.051941)*sailStates.q + (-1.605977)*sailStates.r + (-0.068398)*sailStates.de;
	Cn = (-2.118150)*sailStates.alpha + (-0.080712)*sailStates.beta + (-0.137335)*sailStates.p + (-11.137782)*sailStates.q + (0.139712)*sailStates.r + (-0.004600)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end