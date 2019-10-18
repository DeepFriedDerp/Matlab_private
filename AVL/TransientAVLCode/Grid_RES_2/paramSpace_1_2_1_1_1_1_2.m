function [aeroForces] = paramSpace_1_2_1_1_1_1_2(sailStates,airStates)

	CL = (7.053653)*sailStates.alpha + (-0.418284)*sailStates.beta + (-2.548065)*sailStates.p + (30.176504)*sailStates.q + (0.063215)*sailStates.r + (0.008954)*sailStates.de;
	CD = -3.673750;
	CY = (1.728437)*sailStates.alpha + (-0.000656)*sailStates.beta + (-0.315340)*sailStates.p + (14.115432)*sailStates.q + (-0.039516)*sailStates.r + (0.003004)*sailStates.de;

	Cl = (-0.944845)*sailStates.alpha + (-0.408589)*sailStates.beta + (-1.329610)*sailStates.p + (10.989651)*sailStates.q + (0.685238)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-14.182332)*sailStates.alpha + (2.038835)*sailStates.beta + (9.040401)*sailStates.p + (-137.063843)*sailStates.q + (-0.426728)*sailStates.r + (-0.068298)*sailStates.de;
	Cn = (-1.719944)*sailStates.alpha + (-0.070474)*sailStates.beta + (0.136310)*sailStates.p + (-10.686026)*sailStates.q + (0.127472)*sailStates.r + (-0.004008)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end