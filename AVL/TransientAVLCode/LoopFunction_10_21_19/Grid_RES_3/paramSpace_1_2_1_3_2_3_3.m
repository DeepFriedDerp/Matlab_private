function [aeroForces] = paramSpace_1_2_1_3_2_3_3(sailStates,airStates)

	CL = (3.913848)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.710101)*sailStates.p + (35.357567)*sailStates.q + (-0.323102)*sailStates.r + (0.010356)*sailStates.de;
	CD = -0.043210;
	CY = (0.027597)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.058767)*sailStates.p + (0.173374)*sailStates.q + (0.010346)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.314932)*sailStates.alpha + (-0.036298)*sailStates.beta + (-1.367483)*sailStates.p + (11.322935)*sailStates.q + (-0.097247)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-14.338722)*sailStates.alpha + (0.000000)*sailStates.beta + (9.512464)*sailStates.p + (-142.582367)*sailStates.q + (1.150746)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.185347)*sailStates.alpha + (-0.006400)*sailStates.beta + (-0.366098)*sailStates.p + (2.434695)*sailStates.q + (-0.039350)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end