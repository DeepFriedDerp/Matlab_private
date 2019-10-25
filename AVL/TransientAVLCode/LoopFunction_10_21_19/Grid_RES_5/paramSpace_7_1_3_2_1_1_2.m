function [aeroForces] = paramSpace_7_1_3_2_1_1_2(sailStates,airStates)

	CL = (4.153135)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.801503)*sailStates.p + (37.032291)*sailStates.q + (-0.617701)*sailStates.r + (0.011283)*sailStates.de;
	CD = -0.082470;
	CY = (-0.067910)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.225263)*sailStates.p + (-0.381223)*sailStates.q + (-0.007880)*sailStates.r + (-0.000083)*sailStates.de;

	Cl = (1.337615)*sailStates.alpha + (0.128064)*sailStates.beta + (-1.392422)*sailStates.p + (11.493377)*sailStates.q + (-0.536918)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.540578)*sailStates.alpha + (0.000000)*sailStates.beta + (9.499345)*sailStates.p + (-143.525848)*sailStates.q + (2.092057)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (0.082099)*sailStates.alpha + (0.004472)*sailStates.beta + (0.480451)*sailStates.p + (-1.798979)*sailStates.q + (-0.000278)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end