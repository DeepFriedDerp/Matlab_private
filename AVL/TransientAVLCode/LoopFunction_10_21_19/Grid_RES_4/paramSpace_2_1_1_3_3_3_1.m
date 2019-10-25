function [aeroForces] = paramSpace_2_1_1_3_3_3_1(sailStates,airStates)

	CL = (4.036303)*sailStates.alpha + (0.037894)*sailStates.beta + (-2.264530)*sailStates.p + (31.865656)*sailStates.q + (0.213243)*sailStates.r + (0.010551)*sailStates.de;
	CD = -0.085000;
	CY = (0.037768)*sailStates.alpha + (-0.025385)*sailStates.beta + (0.141138)*sailStates.p + (0.432842)*sailStates.q + (0.009205)*sailStates.r + (0.000092)*sailStates.de;

	Cl = (1.173319)*sailStates.alpha + (-0.072721)*sailStates.beta + (-1.026430)*sailStates.p + (8.147378)*sailStates.q + (0.266579)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.518235)*sailStates.alpha + (-0.097164)*sailStates.beta + (7.904342)*sailStates.p + (-128.769608)*sailStates.q + (-0.698637)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.147236)*sailStates.alpha + (-0.006293)*sailStates.beta + (-0.404077)*sailStates.p + (1.836190)*sailStates.q + (-0.004775)*sailStates.r + (-0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end