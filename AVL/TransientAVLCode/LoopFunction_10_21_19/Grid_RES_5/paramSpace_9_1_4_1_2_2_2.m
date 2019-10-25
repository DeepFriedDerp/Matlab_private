function [aeroForces] = paramSpace_9_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.473471)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.111895)*sailStates.p + (39.906349)*sailStates.q + (1.252390)*sailStates.r + (0.011500)*sailStates.de;
	CD = -0.602130;
	CY = (0.225712)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.522336)*sailStates.p + (0.910011)*sailStates.q + (-0.018144)*sailStates.r + (0.000199)*sailStates.de;

	Cl = (1.361092)*sailStates.alpha + (-0.298004)*sailStates.beta + (-1.640191)*sailStates.p + (13.859346)*sailStates.q + (1.177636)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-13.636150)*sailStates.alpha + (0.000000)*sailStates.beta + (10.437188)*sailStates.p + (-151.817017)*sailStates.q + (-4.301863)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (-0.442654)*sailStates.alpha + (0.010407)*sailStates.beta + (-1.131599)*sailStates.p + (4.152666)*sailStates.q + (-0.000087)*sailStates.r + (-0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end