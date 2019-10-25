function [aeroForces] = paramSpace_6_1_2_1_2_1_2(sailStates,airStates)

	CL = (5.211540)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.102589)*sailStates.p + (40.845394)*sailStates.q + (-1.969022)*sailStates.r + (0.011626)*sailStates.de;
	CD = -1.006660;
	CY = (-0.039151)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.873528)*sailStates.p + (1.113123)*sailStates.q + (-0.061122)*sailStates.r + (0.000242)*sailStates.de;

	Cl = (1.981297)*sailStates.alpha + (0.391788)*sailStates.beta + (-1.629721)*sailStates.p + (14.117158)*sailStates.q + (-1.722091)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.271278)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.031165)*sailStates.p + (-150.805054)*sailStates.q + (6.666551)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (0.397356)*sailStates.alpha + (0.027396)*sailStates.beta + (1.819894)*sailStates.p + (-8.659069)*sailStates.q + (0.014817)*sailStates.r + (-0.000482)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end