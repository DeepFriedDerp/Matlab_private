function [aeroForces] = paramSpace_10_1_4_1_1_2_2(sailStates,airStates)

	CL = (5.207879)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.102278)*sailStates.p + (40.863247)*sailStates.q + (1.978552)*sailStates.r + (0.011593)*sailStates.de;
	CD = -1.012290;
	CY = (0.042345)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.888632)*sailStates.p + (-1.113122)*sailStates.q + (-0.062257)*sailStates.r + (-0.000242)*sailStates.de;

	Cl = (1.986068)*sailStates.alpha + (-0.399343)*sailStates.beta + (-1.629575)*sailStates.p + (14.117959)*sailStates.q + (1.746498)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.203644)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.027286)*sailStates.p + (-150.805054)*sailStates.q + (-6.722041)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (-0.408681)*sailStates.alpha + (0.027925)*sailStates.beta + (-1.842234)*sailStates.p + (8.670532)*sailStates.q + (0.014500)*sailStates.r + (0.000469)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end