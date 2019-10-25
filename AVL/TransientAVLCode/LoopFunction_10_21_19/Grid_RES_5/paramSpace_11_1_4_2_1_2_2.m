function [aeroForces] = paramSpace_11_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.253451)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.779639)*sailStates.p + (37.905437)*sailStates.q + (1.235438)*sailStates.r + (0.011219)*sailStates.de;
	CD = -0.159020;
	CY = (-0.021382)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.475367)*sailStates.p + (-0.493723)*sailStates.q + (-0.050015)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.460437)*sailStates.alpha + (-0.217797)*sailStates.beta + (-1.376723)*sailStates.p + (11.727896)*sailStates.q + (1.027614)*sailStates.r + (0.000609)*sailStates.de;
	Cm = (-13.999376)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.080938)*sailStates.p + (-142.416916)*sailStates.q + (-4.196405)*sailStates.r + (-0.070303)*sailStates.de;
	Cn = (-0.072433)*sailStates.alpha + (0.022891)*sailStates.beta + (-0.911694)*sailStates.p + (3.908022)*sailStates.q + (0.002803)*sailStates.r + (0.000202)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end