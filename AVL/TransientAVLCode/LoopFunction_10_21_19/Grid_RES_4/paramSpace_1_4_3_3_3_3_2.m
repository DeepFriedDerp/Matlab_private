function [aeroForces] = paramSpace_1_4_3_3_3_3_2(sailStates,airStates)

	CL = (3.896666)*sailStates.alpha + (0.057993)*sailStates.beta + (-2.397256)*sailStates.p + (32.740841)*sailStates.q + (-0.438737)*sailStates.r + (0.010057)*sailStates.de;
	CD = -0.048050;
	CY = (0.059445)*sailStates.alpha + (-0.023279)*sailStates.beta + (0.012425)*sailStates.p + (0.489618)*sailStates.q + (0.002489)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.101956)*sailStates.alpha + (0.000738)*sailStates.beta + (-1.082430)*sailStates.p + (8.646905)*sailStates.q + (-0.140760)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-14.371640)*sailStates.alpha + (-0.140198)*sailStates.beta + (8.378871)*sailStates.p + (-133.122269)*sailStates.q + (1.495590)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.138891)*sailStates.alpha + (-0.001522)*sailStates.beta + (-0.220704)*sailStates.p + (1.189389)*sailStates.q + (-0.029143)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end