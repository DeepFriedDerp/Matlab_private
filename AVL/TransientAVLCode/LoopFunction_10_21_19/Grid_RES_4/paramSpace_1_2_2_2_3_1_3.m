function [aeroForces] = paramSpace_1_2_2_2_3_1_3(sailStates,airStates)

	CL = (4.759328)*sailStates.alpha + (-0.167807)*sailStates.beta + (-2.922053)*sailStates.p + (42.336082)*sailStates.q + (-2.363235)*sailStates.r + (0.011500)*sailStates.de;
	CD = -0.645180;
	CY = (-0.000335)*sailStates.alpha + (-0.026137)*sailStates.beta + (-0.865656)*sailStates.p + (1.057313)*sailStates.q + (-0.172228)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.810266)*sailStates.alpha + (0.337327)*sailStates.beta + (-1.507219)*sailStates.p + (14.159680)*sailStates.q + (-1.927425)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-12.473727)*sailStates.alpha + (0.626826)*sailStates.beta + (8.489758)*sailStates.p + (-144.624481)*sailStates.q + (7.845740)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.435692)*sailStates.alpha + (0.079075)*sailStates.beta + (1.672789)*sailStates.p + (-7.227977)*sailStates.q + (0.008998)*sailStates.r + (-0.000445)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end