function [aeroForces] = paramSpace_12_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.747898)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.982546)*sailStates.p + (35.906776)*sailStates.q + (-0.695310)*sailStates.r + (0.010514)*sailStates.de;
	CD = -0.805210;
	CY = (-0.040217)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.560389)*sailStates.p + (0.696926)*sailStates.q + (0.078733)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (1.734816)*sailStates.alpha + (0.252238)*sailStates.beta + (-1.590550)*sailStates.p + (12.827510)*sailStates.q + (-0.817459)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.492898)*sailStates.alpha + (0.000000)*sailStates.beta + (11.001575)*sailStates.p + (-151.165665)*sailStates.q + (2.301253)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.004098)*sailStates.alpha + (-0.035450)*sailStates.beta + (1.440664)*sailStates.p + (-7.762836)*sailStates.q + (-0.056186)*sailStates.r + (-0.000320)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end