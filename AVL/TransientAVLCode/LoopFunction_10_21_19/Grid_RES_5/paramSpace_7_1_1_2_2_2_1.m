function [aeroForces] = paramSpace_7_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.114516)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.352357)*sailStates.p + (32.924389)*sailStates.q + (0.253094)*sailStates.r + (0.010904)*sailStates.de;
	CD = -0.050760;
	CY = (0.035928)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.129455)*sailStates.p + (0.381223)*sailStates.q + (0.004481)*sailStates.r + (0.000082)*sailStates.de;

	Cl = (1.148918)*sailStates.alpha + (-0.080159)*sailStates.beta + (-1.034098)*sailStates.p + (8.077087)*sailStates.q + (0.268822)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.792543)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.135058)*sailStates.p + (-131.546402)*sailStates.q + (-0.836231)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.109630)*sailStates.alpha + (-0.002799)*sailStates.beta + (-0.349874)*sailStates.p + (1.538796)*sailStates.q + (-0.001760)*sailStates.r + (-0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end