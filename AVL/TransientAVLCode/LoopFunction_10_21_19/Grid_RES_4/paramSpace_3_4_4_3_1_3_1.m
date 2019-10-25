function [aeroForces] = paramSpace_3_4_4_3_1_3_1(sailStates,airStates)

	CL = (4.309364)*sailStates.alpha + (-0.266600)*sailStates.beta + (-2.298577)*sailStates.p + (33.427406)*sailStates.q + (1.091846)*sailStates.r + (0.010862)*sailStates.de;
	CD = -0.244320;
	CY = (-0.106295)*sailStates.alpha + (-0.024187)*sailStates.beta + (0.475521)*sailStates.p + (-0.432842)*sailStates.q + (-0.031213)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.186379)*sailStates.alpha + (-0.287289)*sailStates.beta + (-0.939514)*sailStates.p + (7.351154)*sailStates.q + (0.947902)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.130699)*sailStates.alpha + (1.096611)*sailStates.beta + (7.614412)*sailStates.p + (-128.769608)*sailStates.q + (-3.724839)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.393902)*sailStates.alpha + (0.012602)*sailStates.beta + (-0.986983)*sailStates.p + (4.534043)*sailStates.q + (0.006368)*sailStates.r + (0.000185)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end