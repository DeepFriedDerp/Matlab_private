function [aeroForces] = paramSpace_3_3_3_3_3_3_3(sailStates,airStates)

	CL = (4.165881)*sailStates.alpha + (-0.073301)*sailStates.beta + (-2.848797)*sailStates.p + (37.839115)*sailStates.q + (0.894670)*sailStates.r + (0.011313)*sailStates.de;
	CD = -0.142120;
	CY = (0.089630)*sailStates.alpha + (-0.025146)*sailStates.beta + (0.321485)*sailStates.p + (0.432842)*sailStates.q + (-0.021056)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.313923)*sailStates.alpha + (-0.197826)*sailStates.beta + (-1.412740)*sailStates.p + (11.755192)*sailStates.q + (0.771828)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.133240)*sailStates.alpha + (0.291721)*sailStates.beta + (9.535849)*sailStates.p + (-144.575439)*sailStates.q + (-3.048733)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.149821)*sailStates.alpha + (0.011724)*sailStates.beta + (-0.648636)*sailStates.p + (2.295603)*sailStates.q + (-0.002067)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end