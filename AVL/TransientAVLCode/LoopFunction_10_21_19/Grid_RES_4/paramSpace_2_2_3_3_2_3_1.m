function [aeroForces] = paramSpace_2_2_3_3_2_3_1(sailStates,airStates)

	CL = (4.204130)*sailStates.alpha + (0.032713)*sailStates.beta + (-2.289510)*sailStates.p + (32.071468)*sailStates.q + (0.357300)*sailStates.r + (0.010776)*sailStates.de;
	CD = -0.156110;
	CY = (-0.035117)*sailStates.alpha + (-0.024955)*sailStates.beta + (0.250726)*sailStates.p + (-0.065300)*sailStates.q + (0.016431)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.182473)*sailStates.alpha + (-0.114515)*sailStates.beta + (-1.006450)*sailStates.p + (7.809302)*sailStates.q + (0.420510)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.983792)*sailStates.alpha + (-0.143158)*sailStates.beta + (8.034419)*sailStates.p + (-130.047943)*sailStates.q + (-1.219758)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.270937)*sailStates.alpha + (-0.008472)*sailStates.beta + (-0.610333)*sailStates.p + (2.949739)*sailStates.q + (-0.008156)*sailStates.r + (0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end