function [aeroForces] = paramSpace_1_1_4_1_2_3_2(sailStates,airStates)

	CL = (5.769227)*sailStates.alpha + (0.348581)*sailStates.beta + (-2.292303)*sailStates.p + (27.009098)*sailStates.q + (1.285607)*sailStates.r + (0.009045)*sailStates.de;
	CD = -2.045940;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.833556)*sailStates.p + (-0.000002)*sailStates.q + (0.165805)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.714456)*sailStates.alpha + (-0.330468)*sailStates.beta + (-1.148197)*sailStates.p + (8.327803)*sailStates.q + (1.442042)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-16.799213)*sailStates.alpha + (-1.460104)*sailStates.beta + (9.596338)*sailStates.p + (-133.820877)*sailStates.q + (-4.186915)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.563138)*sailStates.alpha + (-0.095402)*sailStates.beta + (-2.083825)*sailStates.p + (9.987566)*sailStates.q + (-0.082621)*sailStates.r + (0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end