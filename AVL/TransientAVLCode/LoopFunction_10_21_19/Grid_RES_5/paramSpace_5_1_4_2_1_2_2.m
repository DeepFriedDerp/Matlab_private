function [aeroForces] = paramSpace_5_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.160632)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.749355)*sailStates.p + (35.700058)*sailStates.q + (0.080591)*sailStates.r + (0.010954)*sailStates.de;
	CD = -0.109690;
	CY = (-0.020867)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.206612)*sailStates.p + (-0.322048)*sailStates.q + (0.021682)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.377237)*sailStates.alpha + (-0.090331)*sailStates.beta + (-1.371358)*sailStates.p + (11.159267)*sailStates.q + (0.223773)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-15.057205)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.628412)*sailStates.p + (-143.031982)*sailStates.q + (-0.292559)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.155572)*sailStates.alpha + (-0.009494)*sailStates.beta + (-0.564567)*sailStates.p + (3.121885)*sailStates.q + (-0.020931)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end