function [aeroForces] = paramSpace_2_3_3_2_2_3_1(sailStates,airStates)

	CL = (4.424787)*sailStates.alpha + (-0.061337)*sailStates.beta + (-2.138230)*sailStates.p + (30.494482)*sailStates.q + (0.732442)*sailStates.r + (0.010627)*sailStates.de;
	CD = -0.426290;
	CY = (-0.083254)*sailStates.alpha + (-0.025009)*sailStates.beta + (0.424983)*sailStates.p + (-0.100923)*sailStates.q + (0.027851)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.096791)*sailStates.alpha + (-0.224767)*sailStates.beta + (-0.854881)*sailStates.p + (6.216564)*sailStates.q + (0.771461)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-15.059346)*sailStates.alpha + (0.255008)*sailStates.beta + (7.639669)*sailStates.p + (-126.149185)*sailStates.q + (-2.490267)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.532711)*sailStates.alpha + (-0.013048)*sailStates.beta + (-0.990764)*sailStates.p + (4.651943)*sailStates.q + (-0.010742)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end