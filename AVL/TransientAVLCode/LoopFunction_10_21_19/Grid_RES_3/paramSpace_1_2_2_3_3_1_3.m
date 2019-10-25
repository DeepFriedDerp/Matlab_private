function [aeroForces] = paramSpace_1_2_2_3_3_1_3(sailStates,airStates)

	CL = (4.340061)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.787266)*sailStates.p + (39.517929)*sailStates.q + (-1.756304)*sailStates.r + (0.011288)*sailStates.de;
	CD = -0.256560;
	CY = (0.022124)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.608719)*sailStates.p + (0.665000)*sailStates.q + (-0.107334)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.525105)*sailStates.alpha + (0.277833)*sailStates.beta + (-1.388083)*sailStates.p + (12.437861)*sailStates.q + (-1.394437)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-13.242870)*sailStates.alpha + (0.000000)*sailStates.beta + (8.605029)*sailStates.p + (-141.960541)*sailStates.q + (5.858944)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.179654)*sailStates.alpha + (0.048989)*sailStates.beta + (1.149363)*sailStates.p + (-4.874151)*sailStates.q + (-0.000056)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end