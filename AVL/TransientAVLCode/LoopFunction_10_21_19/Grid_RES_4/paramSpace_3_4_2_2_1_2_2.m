function [aeroForces] = paramSpace_3_4_2_2_1_2_2(sailStates,airStates)

	CL = (4.057616)*sailStates.alpha + (-0.086261)*sailStates.beta + (-2.539503)*sailStates.p + (34.737129)*sailStates.q + (0.527634)*sailStates.r + (0.010887)*sailStates.de;
	CD = 0.010280;
	CY = (-0.096220)*sailStates.alpha + (-0.024046)*sailStates.beta + (0.192008)*sailStates.p + (-0.769435)*sailStates.q + (-0.012558)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.208050)*sailStates.alpha + (-0.097938)*sailStates.beta + (-1.145235)*sailStates.p + (9.120903)*sailStates.q + (0.376066)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.555895)*sailStates.alpha + (0.277728)*sailStates.beta + (8.603293)*sailStates.p + (-135.788696)*sailStates.q + (-1.767658)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.102066)*sailStates.alpha + (0.003541)*sailStates.beta + (-0.348701)*sailStates.p + (1.992020)*sailStates.q + (0.003054)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end