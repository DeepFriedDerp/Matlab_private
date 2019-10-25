function [aeroForces] = paramSpace_3_2_3_1_2_3_2(sailStates,airStates)

	CL = (6.502077)*sailStates.alpha + (0.200067)*sailStates.beta + (-2.624514)*sailStates.p + (37.636497)*sailStates.q + (2.559999)*sailStates.r + (0.011561)*sailStates.de;
	CD = -2.350500;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.133085)*sailStates.p + (0.000000)*sailStates.q + (-0.074266)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.939746)*sailStates.alpha + (-0.510152)*sailStates.beta + (-1.242642)*sailStates.p + (10.690999)*sailStates.q + (2.320778)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-13.636922)*sailStates.alpha + (-0.786660)*sailStates.beta + (8.261305)*sailStates.p + (-137.194580)*sailStates.q + (-8.687531)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.291786)*sailStates.alpha + (0.038147)*sailStates.beta + (-2.469434)*sailStates.p + (10.936515)*sailStates.q + (0.015020)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end