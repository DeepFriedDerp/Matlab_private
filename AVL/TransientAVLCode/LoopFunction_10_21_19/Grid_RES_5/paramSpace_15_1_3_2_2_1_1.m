function [aeroForces] = paramSpace_15_1_3_2_2_1_1(sailStates,airStates)

	CL = (3.764199)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.192574)*sailStates.p + (31.305616)*sailStates.q + (0.470565)*sailStates.r + (0.009798)*sailStates.de;
	CD = -0.002750;
	CY = (0.076973)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.061202)*sailStates.p + (0.596614)*sailStates.q + (0.015281)*sailStates.r + (0.000125)*sailStates.de;

	Cl = (1.069685)*sailStates.alpha + (0.007155)*sailStates.beta + (-0.964129)*sailStates.p + (7.702903)*sailStates.q + (0.175949)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-14.030510)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.792581)*sailStates.p + (-128.528122)*sailStates.q + (-1.666842)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (-0.324817)*sailStates.alpha + (-0.001784)*sailStates.beta + (0.327412)*sailStates.p + (-2.639619)*sailStates.q + (-0.065619)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end