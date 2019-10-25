function [aeroForces] = paramSpace_3_3_2_1_2_1_1(sailStates,airStates)

	CL = (5.937479)*sailStates.alpha + (0.158689)*sailStates.beta + (-1.624060)*sailStates.p + (25.133827)*sailStates.q + (-2.008293)*sailStates.r + (0.010134)*sailStates.de;
	CD = -2.240060;
	CY = (0.399921)*sailStates.alpha + (-0.025048)*sailStates.beta + (-1.017634)*sailStates.p + (0.221995)*sailStates.q + (0.066691)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.123473)*sailStates.alpha + (0.544257)*sailStates.beta + (-0.450712)*sailStates.p + (2.175784)*sailStates.q + (-1.957811)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-14.970194)*sailStates.alpha + (-0.635418)*sailStates.beta + (6.298249)*sailStates.p + (-112.898659)*sailStates.q + (6.811248)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-2.049335)*sailStates.alpha + (-0.031546)*sailStates.beta + (2.291918)*sailStates.p + (-10.531326)*sailStates.q + (-0.020014)*sailStates.r + (-0.000223)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end