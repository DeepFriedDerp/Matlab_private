function [aeroForces] = paramSpace_1_4_2_3_2_1_1(sailStates,airStates)

	CL = (4.094713)*sailStates.alpha + (0.354173)*sailStates.beta + (-2.260188)*sailStates.p + (35.229969)*sailStates.q + (-1.543396)*sailStates.r + (0.010768)*sailStates.de;
	CD = -0.183210;
	CY = (0.030077)*sailStates.alpha + (-0.025426)*sailStates.beta + (-0.499242)*sailStates.p + (-0.194784)*sailStates.q + (-0.099298)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.078554)*sailStates.alpha + (0.350202)*sailStates.beta + (-0.916903)*sailStates.p + (7.871861)*sailStates.q + (-1.205048)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-12.399307)*sailStates.alpha + (-1.340783)*sailStates.beta + (6.862782)*sailStates.p + (-126.796555)*sailStates.q + (5.150431)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.261589)*sailStates.alpha + (0.050111)*sailStates.beta + (0.992145)*sailStates.p + (-3.840068)*sailStates.q + (-0.006118)*sailStates.r + (-0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end