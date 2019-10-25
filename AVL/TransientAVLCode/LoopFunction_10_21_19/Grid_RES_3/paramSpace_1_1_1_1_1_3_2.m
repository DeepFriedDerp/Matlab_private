function [aeroForces] = paramSpace_1_1_1_1_1_3_2(sailStates,airStates)

	CL = (6.641772)*sailStates.alpha + (0.331071)*sailStates.beta + (-2.377138)*sailStates.p + (27.756401)*sailStates.q + (1.789178)*sailStates.r + (0.009112)*sailStates.de;
	CD = -2.554670;
	CY = (-0.168623)*sailStates.alpha + (-0.020207)*sailStates.beta + (1.086572)*sailStates.p + (-1.671347)*sailStates.q + (0.191751)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (2.512074)*sailStates.alpha + (-0.370768)*sailStates.beta + (-1.188004)*sailStates.p + (8.412714)*sailStates.q + (1.799542)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-17.819567)*sailStates.alpha + (-1.217403)*sailStates.beta + (10.068559)*sailStates.p + (-136.726761)*sailStates.q + (-5.821949)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.815809)*sailStates.alpha + (-0.100666)*sailStates.beta + (-2.615829)*sailStates.p + (13.836129)*sailStates.q + (-0.107360)*sailStates.r + (0.000705)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end