function [aeroForces] = paramSpace_1_3_4_3_1_2_1(sailStates,airStates)

	CL = (3.877541)*sailStates.alpha + (0.047878)*sailStates.beta + (-2.244912)*sailStates.p + (32.991936)*sailStates.q + (-0.747861)*sailStates.r + (0.010648)*sailStates.de;
	CD = 0.059480;
	CY = (-0.075293)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.091308)*sailStates.p + (-0.684401)*sailStates.q + (-0.018236)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.019949)*sailStates.alpha + (0.087812)*sailStates.beta + (-0.951030)*sailStates.p + (7.697762)*sailStates.q + (-0.453801)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-14.004160)*sailStates.alpha + (-0.146634)*sailStates.beta + (7.543541)*sailStates.p + (-128.521423)*sailStates.q + (2.504004)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.137756)*sailStates.alpha + (0.015980)*sailStates.beta + (0.091267)*sailStates.p + (0.461568)*sailStates.q + (-0.034665)*sailStates.r + (0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end