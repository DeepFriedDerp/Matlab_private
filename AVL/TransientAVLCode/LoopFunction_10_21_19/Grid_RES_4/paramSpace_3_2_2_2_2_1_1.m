function [aeroForces] = paramSpace_3_2_2_2_2_1_1(sailStates,airStates)

	CL = (4.424787)*sailStates.alpha + (-0.061337)*sailStates.beta + (-2.138230)*sailStates.p + (30.494482)*sailStates.q + (-0.732442)*sailStates.r + (0.010627)*sailStates.de;
	CD = -0.426290;
	CY = (0.083254)*sailStates.alpha + (-0.024944)*sailStates.beta + (-0.424983)*sailStates.p + (0.100923)*sailStates.q + (0.027851)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.153754)*sailStates.alpha + (0.191790)*sailStates.beta + (-0.887530)*sailStates.p + (6.620444)*sailStates.q + (-0.769335)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-15.059346)*sailStates.alpha + (0.255009)*sailStates.beta + (7.639669)*sailStates.p + (-126.149185)*sailStates.q + (2.490266)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.518184)*sailStates.alpha + (-0.014255)*sailStates.beta + (0.992904)*sailStates.p + (-4.678414)*sailStates.q + (-0.010882)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end