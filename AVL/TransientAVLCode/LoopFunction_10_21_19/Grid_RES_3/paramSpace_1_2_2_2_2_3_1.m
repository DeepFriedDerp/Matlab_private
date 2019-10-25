function [aeroForces] = paramSpace_1_2_2_2_2_3_1(sailStates,airStates)

	CL = (4.178534)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.042839)*sailStates.p + (28.743628)*sailStates.q + (0.278071)*sailStates.r + (0.009931)*sailStates.de;
	CD = -0.344680;
	CY = (-0.085372)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.315048)*sailStates.p + (-0.267956)*sailStates.q + (0.055551)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.052328)*sailStates.alpha + (-0.146835)*sailStates.beta + (-0.832367)*sailStates.p + (5.982001)*sailStates.q + (0.456791)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-15.125649)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.639017)*sailStates.p + (-124.628265)*sailStates.q + (-0.874263)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (0.518379)*sailStates.alpha + (-0.025891)*sailStates.beta + (-0.825950)*sailStates.p + (4.262434)*sailStates.q + (-0.039213)*sailStates.r + (0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end