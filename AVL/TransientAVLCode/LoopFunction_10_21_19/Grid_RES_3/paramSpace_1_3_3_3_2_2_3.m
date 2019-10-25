function [aeroForces] = paramSpace_1_3_3_3_2_2_3(sailStates,airStates)

	CL = (3.876455)*sailStates.alpha + (0.148324)*sailStates.beta + (-2.739645)*sailStates.p + (37.076427)*sailStates.q + (-0.952667)*sailStates.r + (0.010836)*sailStates.de;
	CD = 0.054700;
	CY = (-0.000822)*sailStates.alpha + (-0.024437)*sailStates.beta + (-0.205220)*sailStates.p + (0.173374)*sailStates.q + (-0.036169)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.232112)*sailStates.alpha + (0.150487)*sailStates.beta + (-1.332225)*sailStates.p + (11.267762)*sailStates.q + (-0.634981)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-13.875441)*sailStates.alpha + (-0.464030)*sailStates.beta + (9.095638)*sailStates.p + (-141.665955)*sailStates.q + (3.175712)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.165261)*sailStates.alpha + (0.018965)*sailStates.beta + (0.271247)*sailStates.p + (-0.729236)*sailStates.q + (-0.022973)*sailStates.r + (-0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end