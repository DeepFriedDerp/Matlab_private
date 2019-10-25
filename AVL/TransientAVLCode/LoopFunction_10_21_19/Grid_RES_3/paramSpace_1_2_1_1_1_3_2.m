function [aeroForces] = paramSpace_1_2_1_1_1_3_2(sailStates,airStates)

	CL = (6.690155)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.394055)*sailStates.p + (27.995087)*sailStates.q + (1.783147)*sailStates.r + (0.009246)*sailStates.de;
	CD = -2.552180;
	CY = (-0.170057)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.085099)*sailStates.p + (-1.671347)*sailStates.q + (0.191491)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (2.453479)*sailStates.alpha + (-0.475894)*sailStates.beta + (-1.153635)*sailStates.p + (7.949161)*sailStates.q + (1.802754)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-18.022575)*sailStates.alpha + (0.000000)*sailStates.beta + (10.124712)*sailStates.p + (-137.643188)*sailStates.q + (-5.801455)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.865907)*sailStates.alpha + (-0.083913)*sailStates.beta + (-2.606321)*sailStates.p + (13.738374)*sailStates.q + (-0.106187)*sailStates.r + (0.000709)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end