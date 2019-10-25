function [aeroForces] = paramSpace_2_2_1_2_3_2_3(sailStates,airStates)

	CL = (4.017561)*sailStates.alpha + (-0.045902)*sailStates.beta + (-2.960698)*sailStates.p + (38.295155)*sailStates.q + (-0.601294)*sailStates.r + (0.011194)*sailStates.de;
	CD = 0.024990;
	CY = (0.069876)*sailStates.alpha + (-0.025379)*sailStates.beta + (-0.238934)*sailStates.p + (0.870358)*sailStates.q + (-0.015752)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.458559)*sailStates.alpha + (0.070275)*sailStates.beta + (-1.547898)*sailStates.p + (13.051981)*sailStates.q + (-0.473538)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.399720)*sailStates.alpha + (0.193786)*sailStates.beta + (10.005626)*sailStates.p + (-147.878265)*sailStates.q + (2.059746)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.055521)*sailStates.alpha + (0.005833)*sailStates.beta + (0.401518)*sailStates.p + (-1.990825)*sailStates.q + (0.001785)*sailStates.r + (-0.000265)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end