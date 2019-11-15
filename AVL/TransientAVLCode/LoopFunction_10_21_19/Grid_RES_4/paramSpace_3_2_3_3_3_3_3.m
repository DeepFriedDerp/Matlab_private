function [aeroForces] = paramSpace_3_2_3_3_3_3_3(sailStates,airStates)

	CL = (4.165881)*sailStates.alpha + (0.073301)*sailStates.beta + (-2.848797)*sailStates.p + (37.839115)*sailStates.q + (0.894670)*sailStates.r + (0.011313)*sailStates.de;
	CD = -0.142120;
	CY = (0.089630)*sailStates.alpha + (-0.024807)*sailStates.beta + (0.321485)*sailStates.p + (0.432842)*sailStates.q + (-0.021056)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.359574)*sailStates.alpha + (-0.158151)*sailStates.beta + (-1.445388)*sailStates.p + (12.159073)*sailStates.q + (0.773982)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.133238)*sailStates.alpha + (-0.291721)*sailStates.beta + (9.535849)*sailStates.p + (-144.575424)*sailStates.q + (-3.048734)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.168429)*sailStates.alpha + (0.011608)*sailStates.beta + (-0.646496)*sailStates.p + (2.269131)*sailStates.q + (-0.002209)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end