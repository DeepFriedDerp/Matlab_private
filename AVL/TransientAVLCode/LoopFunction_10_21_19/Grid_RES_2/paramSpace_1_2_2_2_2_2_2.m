function [aeroForces] = paramSpace_1_2_2_2_2_2_2(sailStates,airStates)

	CL = (4.022309)*sailStates.alpha + (0.009034)*sailStates.beta + (-2.702353)*sailStates.p + (35.459652)*sailStates.q + (-0.274277)*sailStates.r + (0.010731)*sailStates.de;
	CD = -0.041440;
	CY = (0.066409)*sailStates.alpha + (-0.024246)*sailStates.beta + (0.034819)*sailStates.p + (0.513811)*sailStates.q + (0.004620)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.255136)*sailStates.alpha + (-0.025887)*sailStates.beta + (-1.314541)*sailStates.p + (10.702467)*sailStates.q + (-0.054479)*sailStates.r + (0.000512)*sailStates.de;
	Cm = (-14.694211)*sailStates.alpha + (0.032610)*sailStates.beta + (9.359101)*sailStates.p + (-141.379639)*sailStates.q + (0.909267)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.082611)*sailStates.alpha + (-0.003672)*sailStates.beta + (-0.234470)*sailStates.p + (1.125033)*sailStates.q + (-0.015457)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end