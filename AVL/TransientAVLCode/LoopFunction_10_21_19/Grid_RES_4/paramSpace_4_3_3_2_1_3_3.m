function [aeroForces] = paramSpace_4_3_3_2_1_3_3(sailStates,airStates)

	CL = (4.759327)*sailStates.alpha + (-0.167807)*sailStates.beta + (-2.922053)*sailStates.p + (42.336082)*sailStates.q + (2.363235)*sailStates.r + (0.011500)*sailStates.de;
	CD = -0.645180;
	CY = (0.000335)*sailStates.alpha + (-0.023815)*sailStates.beta + (0.865656)*sailStates.p + (-1.057313)*sailStates.q + (-0.172228)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.773219)*sailStates.alpha + (-0.443149)*sailStates.beta + (-1.475681)*sailStates.p + (13.762716)*sailStates.q + (1.921138)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-12.473727)*sailStates.alpha + (0.626826)*sailStates.beta + (8.489758)*sailStates.p + (-144.624466)*sailStates.q + (-7.845737)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.392878)*sailStates.alpha + (0.076171)*sailStates.beta + (-1.679062)*sailStates.p + (7.306938)*sailStates.q + (0.010249)*sailStates.r + (0.000445)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end