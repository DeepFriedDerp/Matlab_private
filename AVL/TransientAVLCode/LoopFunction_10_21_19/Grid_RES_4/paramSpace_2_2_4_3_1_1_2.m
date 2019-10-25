function [aeroForces] = paramSpace_2_2_4_3_1_1_2(sailStates,airStates)

	CL = (4.207940)*sailStates.alpha + (-0.057174)*sailStates.beta + (-2.589073)*sailStates.p + (35.697498)*sailStates.q + (-0.842701)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.126310;
	CY = (-0.063137)*sailStates.alpha + (-0.024851)*sailStates.beta + (-0.280940)*sailStates.p + (-0.498143)*sailStates.q + (-0.018466)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.276585)*sailStates.alpha + (0.142150)*sailStates.beta + (-1.233054)*sailStates.p + (10.184868)*sailStates.q + (-0.697989)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-14.403444)*sailStates.alpha + (0.194504)*sailStates.beta + (8.673835)*sailStates.p + (-137.428818)*sailStates.q + (2.831703)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (0.017363)*sailStates.alpha + (0.010542)*sailStates.beta + (0.594492)*sailStates.p + (-2.228601)*sailStates.q + (-0.001662)*sailStates.r + (0.000074)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end