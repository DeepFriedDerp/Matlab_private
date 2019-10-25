function [aeroForces] = paramSpace_3_4_1_1_3_1_2(sailStates,airStates)

	CL = (7.271598)*sailStates.alpha + (0.542248)*sailStates.beta + (-2.506555)*sailStates.p + (31.925461)*sailStates.q + (-2.346432)*sailStates.r + (0.010390)*sailStates.de;
	CD = -2.855040;
	CY = (0.194453)*sailStates.alpha + (-0.026056)*sailStates.beta + (-1.271054)*sailStates.p + (1.693496)*sailStates.q + (0.083131)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (2.605172)*sailStates.alpha + (0.716143)*sailStates.beta + (-1.142443)*sailStates.p + (8.375044)*sailStates.q + (-2.252280)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-17.243614)*sailStates.alpha + (-2.195636)*sailStates.beta + (9.383025)*sailStates.p + (-136.946671)*sailStates.q + (7.962562)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.823989)*sailStates.alpha + (-0.031693)*sailStates.beta + (2.848614)*sailStates.p + (-14.261488)*sailStates.q + (-0.034291)*sailStates.r + (-0.000703)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end