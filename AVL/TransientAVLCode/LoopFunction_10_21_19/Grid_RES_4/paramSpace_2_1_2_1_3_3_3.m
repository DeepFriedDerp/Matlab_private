function [aeroForces] = paramSpace_2_1_2_1_3_3_3(sailStates,airStates)

	CL = (5.052056)*sailStates.alpha + (0.360887)*sailStates.beta + (-3.356642)*sailStates.p + (39.313339)*sailStates.q + (1.327630)*sailStates.r + (0.010772)*sailStates.de;
	CD = -1.670980;
	CY = (0.469462)*sailStates.alpha + (-0.027032)*sailStates.beta + (0.657727)*sailStates.p + (1.915491)*sailStates.q + (0.043042)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.361900)*sailStates.alpha + (-0.320605)*sailStates.beta + (-1.941374)*sailStates.p + (16.350674)*sailStates.q + (1.380383)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.101746)*sailStates.alpha + (-1.449301)*sailStates.beta + (11.940729)*sailStates.p + (-159.650192)*sailStates.q + (-4.515228)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.997189)*sailStates.alpha + (-0.027800)*sailStates.beta + (-1.660218)*sailStates.p + (6.653466)*sailStates.q + (-0.009901)*sailStates.r + (-0.000375)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end