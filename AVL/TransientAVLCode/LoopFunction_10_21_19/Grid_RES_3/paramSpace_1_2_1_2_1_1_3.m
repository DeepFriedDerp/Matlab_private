function [aeroForces] = paramSpace_1_2_1_2_1_1_3(sailStates,airStates)

	CL = (4.173587)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.981614)*sailStates.p + (41.688194)*sailStates.q + (-1.856267)*sailStates.r + (0.011489)*sailStates.de;
	CD = -0.365890;
	CY = (-0.170701)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.610139)*sailStates.p + (-0.491415)*sailStates.q + (-0.107537)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.295020)*sailStates.alpha + (0.324668)*sailStates.beta + (-1.528995)*sailStates.p + (13.761585)*sailStates.q + (-1.537567)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-11.998868)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.212577)*sailStates.p + (-147.390610)*sailStates.q + (6.239230)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.506062)*sailStates.alpha + (0.057248)*sailStates.beta + (1.149047)*sailStates.p + (-3.773179)*sailStates.q + (-0.021296)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end