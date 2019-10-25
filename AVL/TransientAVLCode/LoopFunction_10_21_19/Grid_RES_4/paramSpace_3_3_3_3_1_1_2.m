function [aeroForces] = paramSpace_3_3_3_3_1_1_2(sailStates,airStates)

	CL = (4.150134)*sailStates.alpha + (0.017936)*sailStates.beta + (-2.544499)*sailStates.p + (34.223923)*sailStates.q + (-0.184512)*sailStates.r + (0.010867)*sailStates.de;
	CD = -0.101630;
	CY = (-0.061529)*sailStates.alpha + (-0.024781)*sailStates.beta + (-0.144698)*sailStates.p + (-0.498142)*sailStates.q + (0.009466)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.223308)*sailStates.alpha + (0.096550)*sailStates.beta + (-1.183147)*sailStates.p + (9.387577)*sailStates.q + (-0.264614)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.861818)*sailStates.alpha + (-0.071515)*sailStates.beta + (8.842751)*sailStates.p + (-136.960373)*sailStates.q + (0.621740)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.081491)*sailStates.alpha + (-0.005856)*sailStates.beta + (0.413029)*sailStates.p + (-1.775718)*sailStates.q + (-0.004639)*sailStates.r + (0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end