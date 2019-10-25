function [aeroForces] = paramSpace_14_1_1_2_2_1_1(sailStates,airStates)

	CL = (3.963453)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.234332)*sailStates.p + (31.412216)*sailStates.q + (0.302621)*sailStates.r + (0.010233)*sailStates.de;
	CD = -0.061800;
	CY = (0.080096)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.125022)*sailStates.p + (0.571905)*sailStates.q + (0.026513)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.109691)*sailStates.alpha + (0.039846)*sailStates.beta + (-0.983522)*sailStates.p + (7.738481)*sailStates.q + (0.025421)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-14.797181)*sailStates.alpha + (0.000000)*sailStates.beta + (7.971843)*sailStates.p + (-129.462372)*sailStates.q + (-1.049571)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.329107)*sailStates.alpha + (-0.008469)*sailStates.beta + (0.425200)*sailStates.p + (-2.788775)*sailStates.q + (-0.051572)*sailStates.r + (-0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end