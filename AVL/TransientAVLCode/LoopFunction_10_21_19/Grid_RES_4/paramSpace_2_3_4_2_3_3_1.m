function [aeroForces] = paramSpace_2_3_4_2_3_3_1(sailStates,airStates)

	CL = (4.291398)*sailStates.alpha + (-0.059187)*sailStates.beta + (-2.130690)*sailStates.p + (30.520512)*sailStates.q + (0.539549)*sailStates.r + (0.010656)*sailStates.de;
	CD = -0.336450;
	CY = (0.029216)*sailStates.alpha + (-0.024809)*sailStates.beta + (0.315440)*sailStates.p + (0.668510)*sailStates.q + (0.020746)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (0.966577)*sailStates.alpha + (-0.196772)*sailStates.beta + (-0.850170)*sailStates.p + (6.229241)*sailStates.q + (0.630884)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.864492)*sailStates.alpha + (0.268738)*sailStates.beta + (7.554382)*sailStates.p + (-125.787453)*sailStates.q + (-1.865758)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.338324)*sailStates.alpha + (-0.011767)*sailStates.beta + (-0.757235)*sailStates.p + (2.935925)*sailStates.q + (-0.005053)*sailStates.r + (-0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end