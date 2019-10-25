function [aeroForces] = paramSpace_14_1_3_2_2_2_2(sailStates,airStates)

	CL = (3.940578)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.730139)*sailStates.p + (39.122868)*sailStates.q + (1.586441)*sailStates.r + (0.011058)*sailStates.de;
	CD = -0.062370;
	CY = (0.072697)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.455243)*sailStates.p + (0.230434)*sailStates.q + (-0.096757)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.259219)*sailStates.alpha + (-0.236751)*sailStates.beta + (-1.347189)*sailStates.p + (12.083887)*sailStates.q + (1.226756)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-12.524734)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.509914)*sailStates.p + (-140.986252)*sailStates.q + (-5.299416)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (-0.276810)*sailStates.alpha + (0.050323)*sailStates.beta + (-0.793920)*sailStates.p + (2.396888)*sailStates.q + (-0.031184)*sailStates.r + (0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end