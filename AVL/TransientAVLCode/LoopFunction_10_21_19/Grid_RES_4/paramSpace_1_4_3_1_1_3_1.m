function [aeroForces] = paramSpace_1_4_3_1_1_3_1(sailStates,airStates)

	CL = (6.452842)*sailStates.alpha + (-0.434631)*sailStates.beta + (-1.488407)*sailStates.p + (19.518890)*sailStates.q + (2.045712)*sailStates.r + (0.008598)*sailStates.de;
	CD = -2.676590;
	CY = (-0.674769)*sailStates.alpha + (-0.031949)*sailStates.beta + (1.188845)*sailStates.p + (-2.326708)*sailStates.q + (0.236393)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (1.751215)*sailStates.alpha + (-0.642952)*sailStates.beta + (-0.384422)*sailStates.p + (0.318348)*sailStates.q + (2.067484)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-18.282465)*sailStates.alpha + (1.681063)*sailStates.beta + (7.403773)*sailStates.p + (-112.315697)*sailStates.q + (-6.650648)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (2.647819)*sailStates.alpha + (-0.080489)*sailStates.beta + (-2.681779)*sailStates.p + (13.701015)*sailStates.q + (-0.106923)*sailStates.r + (0.000840)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end