function [aeroForces] = paramSpace_4_2_3_1_2_3_1(sailStates,airStates)

	CL = (6.250816)*sailStates.alpha + (0.231215)*sailStates.beta + (-1.797661)*sailStates.p + (35.973511)*sailStates.q + (2.899250)*sailStates.r + (0.011757)*sailStates.de;
	CD = -2.353080;
	CY = (-0.341731)*sailStates.alpha + (-0.024249)*sailStates.beta + (1.155600)*sailStates.p + (0.662190)*sailStates.q + (-0.229839)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (1.346917)*sailStates.alpha + (-0.543852)*sailStates.beta + (-0.532948)*sailStates.p + (5.463631)*sailStates.q + (2.499646)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-9.126980)*sailStates.alpha + (-0.884074)*sailStates.beta + (3.942794)*sailStates.p + (-110.966957)*sailStates.q + (-9.597300)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (1.978354)*sailStates.alpha + (0.122795)*sailStates.beta + (-2.583786)*sailStates.p + (11.002065)*sailStates.q + (0.037728)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end