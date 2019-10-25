function [aeroForces] = paramSpace_3_1_3_1_3_3_1(sailStates,airStates)

	CL = (5.270479)*sailStates.alpha + (0.520586)*sailStates.beta + (-1.737367)*sailStates.p + (30.108860)*sailStates.q + (1.998284)*sailStates.r + (0.010995)*sailStates.de;
	CD = -1.809160;
	CY = (-0.054341)*sailStates.alpha + (-0.022540)*sailStates.beta + (0.822658)*sailStates.p + (1.915493)*sailStates.q + (-0.053852)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.609596)*sailStates.alpha + (-0.357502)*sailStates.beta + (-0.553887)*sailStates.p + (4.282876)*sailStates.q + (1.864523)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-11.316395)*sailStates.alpha + (-2.087105)*sailStates.beta + (5.435949)*sailStates.p + (-112.650780)*sailStates.q + (-6.808972)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (1.342163)*sailStates.alpha + (0.032329)*sailStates.beta + (-1.877794)*sailStates.p + (7.046671)*sailStates.q + (0.003090)*sailStates.r + (-0.000417)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end