function [aeroForces] = paramSpace_2_2_3_1_1_3_2(sailStates,airStates)

	CL = (7.294268)*sailStates.alpha + (0.173930)*sailStates.beta + (-2.525846)*sailStates.p + (32.207996)*sailStates.q + (2.335243)*sailStates.r + (0.010523)*sailStates.de;
	CD = -2.827860;
	CY = (-0.196044)*sailStates.alpha + (-0.024432)*sailStates.beta + (1.255662)*sailStates.p + (-1.693494)*sailStates.q + (0.082241)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.719268)*sailStates.alpha + (-0.507902)*sailStates.beta + (-1.216692)*sailStates.p + (9.256495)*sailStates.q + (2.222611)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-17.397577)*sailStates.alpha + (-0.687709)*sailStates.beta + (9.446370)*sailStates.p + (-137.990799)*sailStates.q + (-7.903648)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.738766)*sailStates.alpha + (-0.038595)*sailStates.beta + (-2.830245)*sailStates.p + (14.301125)*sailStates.q + (-0.034576)*sailStates.r + (0.000718)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end