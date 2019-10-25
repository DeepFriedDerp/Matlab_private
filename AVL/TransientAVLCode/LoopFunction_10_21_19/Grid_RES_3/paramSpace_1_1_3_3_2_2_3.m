function [aeroForces] = paramSpace_1_1_3_3_2_2_3(sailStates,airStates)

	CL = (3.876455)*sailStates.alpha + (-0.148324)*sailStates.beta + (-2.739645)*sailStates.p + (37.076427)*sailStates.q + (-0.952667)*sailStates.r + (0.010836)*sailStates.de;
	CD = 0.054700;
	CY = (-0.000822)*sailStates.alpha + (-0.025225)*sailStates.beta + (-0.205220)*sailStates.p + (0.173374)*sailStates.q + (-0.036169)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.349169)*sailStates.alpha + (0.037193)*sailStates.beta + (-1.416877)*sailStates.p + (12.328630)*sailStates.q + (-0.649806)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.875441)*sailStates.alpha + (0.464030)*sailStates.beta + (9.095637)*sailStates.p + (-141.665955)*sailStates.q + (3.175712)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.208810)*sailStates.alpha + (0.014129)*sailStates.beta + (0.256321)*sailStates.p + (-0.542176)*sailStates.q + (-0.025587)*sailStates.r + (-0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end