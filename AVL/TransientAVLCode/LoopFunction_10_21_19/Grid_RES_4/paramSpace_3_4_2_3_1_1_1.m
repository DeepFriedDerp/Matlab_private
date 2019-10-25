function [aeroForces] = paramSpace_3_4_2_3_1_1_1(sailStates,airStates)

	CL = (4.085153)*sailStates.alpha + (0.080294)*sailStates.beta + (-2.264961)*sailStates.p + (31.832903)*sailStates.q + (-0.229682)*sailStates.r + (0.010610)*sailStates.de;
	CD = -0.116070;
	CY = (-0.034570)*sailStates.alpha + (-0.024370)*sailStates.beta + (-0.170706)*sailStates.p + (-0.432842)*sailStates.q + (0.011204)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.007787)*sailStates.alpha + (0.118627)*sailStates.beta + (-0.928960)*sailStates.p + (6.937305)*sailStates.q + (-0.320109)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.648736)*sailStates.alpha + (-0.368222)*sailStates.beta + (7.910576)*sailStates.p + (-128.769608)*sailStates.q + (0.793753)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.168912)*sailStates.alpha + (-0.006071)*sailStates.beta + (0.441364)*sailStates.p + (-1.780086)*sailStates.q + (-0.004020)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end