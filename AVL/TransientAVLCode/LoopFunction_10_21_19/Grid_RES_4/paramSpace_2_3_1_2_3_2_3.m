function [aeroForces] = paramSpace_2_3_1_2_3_2_3(sailStates,airStates)

	CL = (4.017561)*sailStates.alpha + (0.045902)*sailStates.beta + (-2.960698)*sailStates.p + (38.295158)*sailStates.q + (-0.601294)*sailStates.r + (0.011194)*sailStates.de;
	CD = 0.024990;
	CY = (0.069876)*sailStates.alpha + (-0.024574)*sailStates.beta + (-0.238934)*sailStates.p + (0.870358)*sailStates.q + (-0.015752)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.414033)*sailStates.alpha + (0.097961)*sailStates.beta + (-1.515252)*sailStates.p + (12.648098)*sailStates.q + (-0.471356)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.399722)*sailStates.alpha + (-0.193786)*sailStates.beta + (10.005627)*sailStates.p + (-147.878265)*sailStates.q + (2.059746)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.045218)*sailStates.alpha + (0.005194)*sailStates.beta + (0.403658)*sailStates.p + (-2.017297)*sailStates.q + (0.001928)*sailStates.r + (-0.000265)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end