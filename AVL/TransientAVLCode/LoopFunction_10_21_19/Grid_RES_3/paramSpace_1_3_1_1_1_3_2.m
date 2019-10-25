function [aeroForces] = paramSpace_1_3_1_1_1_3_2(sailStates,airStates)

	CL = (6.641772)*sailStates.alpha + (-0.331071)*sailStates.beta + (-2.377137)*sailStates.p + (27.756403)*sailStates.q + (1.789178)*sailStates.r + (0.009112)*sailStates.de;
	CD = -2.554670;
	CY = (-0.168623)*sailStates.alpha + (-0.029455)*sailStates.beta + (1.086572)*sailStates.p + (-1.671347)*sailStates.q + (0.191751)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (2.366016)*sailStates.alpha + (-0.578981)*sailStates.beta + (-1.103386)*sailStates.p + (7.351849)*sailStates.q + (1.814564)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-17.819565)*sailStates.alpha + (1.217403)*sailStates.beta + (10.068559)*sailStates.p + (-136.726761)*sailStates.q + (-5.821945)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.904163)*sailStates.alpha + (-0.066800)*sailStates.beta + (-2.600909)*sailStates.p + (13.649069)*sailStates.q + (-0.104711)*sailStates.r + (0.000705)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end