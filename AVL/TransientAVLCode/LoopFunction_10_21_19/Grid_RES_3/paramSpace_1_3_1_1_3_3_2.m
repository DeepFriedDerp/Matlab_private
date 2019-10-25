function [aeroForces] = paramSpace_1_3_1_1_3_3_2(sailStates,airStates)

	CL = (5.022632)*sailStates.alpha + (-0.224824)*sailStates.beta + (-2.289029)*sailStates.p + (28.246319)*sailStates.q + (0.929674)*sailStates.r + (0.009099)*sailStates.de;
	CD = -1.511500;
	CY = (0.185879)*sailStates.alpha + (-0.020207)*sailStates.beta + (0.553324)*sailStates.p + (1.671347)*sailStates.q + (0.097407)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.039356)*sailStates.alpha + (-0.396703)*sailStates.beta + (-1.048520)*sailStates.p + (7.506885)*sailStates.q + (1.109712)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-15.125087)*sailStates.alpha + (0.864725)*sailStates.beta + (9.050066)*sailStates.p + (-132.498779)*sailStates.q + (-3.024701)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (0.325939)*sailStates.alpha + (-0.056322)*sailStates.beta + (-1.482991)*sailStates.p + (6.067277)*sailStates.q + (-0.033105)*sailStates.r + (-0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end