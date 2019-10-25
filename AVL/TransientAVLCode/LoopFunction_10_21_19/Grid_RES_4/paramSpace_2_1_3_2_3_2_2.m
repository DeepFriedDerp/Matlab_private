function [aeroForces] = paramSpace_2_1_3_2_3_2_2(sailStates,airStates)

	CL = (4.057616)*sailStates.alpha + (-0.086261)*sailStates.beta + (-2.539503)*sailStates.p + (34.737129)*sailStates.q + (-0.527634)*sailStates.r + (0.010887)*sailStates.de;
	CD = 0.010280;
	CY = (0.096220)*sailStates.alpha + (-0.025526)*sailStates.beta + (-0.192008)*sailStates.p + (0.769435)*sailStates.q + (-0.012558)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.356963)*sailStates.alpha + (0.029597)*sailStates.beta + (-1.242934)*sailStates.p + (10.329466)*sailStates.q + (-0.382427)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.555895)*sailStates.alpha + (0.277728)*sailStates.beta + (8.603294)*sailStates.p + (-135.788696)*sailStates.q + (1.767658)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.075290)*sailStates.alpha + (0.004818)*sailStates.beta + (0.342297)*sailStates.p + (-1.912807)*sailStates.q + (0.002638)*sailStates.r + (-0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end