function [aeroForces] = paramSpace_1_3_1_1_1_1_1(sailStates,airStates)

	CL = (5.301775)*sailStates.alpha + (0.218327)*sailStates.beta + (-1.846246)*sailStates.p + (35.747326)*sailStates.q + (-2.480637)*sailStates.r + (0.011677)*sailStates.de;
	CD = -1.823620;
	CY = (0.014478)*sailStates.alpha + (-0.027693)*sailStates.beta + (-0.905408)*sailStates.p + (-2.326711)*sailStates.q + (-0.179847)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (0.512858)*sailStates.alpha + (0.594390)*sailStates.beta + (-0.531726)*sailStates.p + (4.982191)*sailStates.q + (-2.166305)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-8.228373)*sailStates.alpha + (-0.862485)*sailStates.beta + (4.504488)*sailStates.p + (-113.341965)*sailStates.q + (8.262918)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-1.448611)*sailStates.alpha + (0.108185)*sailStates.beta + (2.053649)*sailStates.p + (-7.305094)*sailStates.q + (-0.002105)*sailStates.r + (0.000526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end