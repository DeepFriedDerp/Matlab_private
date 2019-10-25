function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (4.108800)*sailStates.alpha + (0.071195)*sailStates.beta + (-3.239015)*sailStates.p + (38.710011)*sailStates.q + (0.338906)*sailStates.r + (0.010599)*sailStates.de;
	CD = -0.405100;
	CY = (0.052490)*sailStates.alpha + (-0.023412)*sailStates.beta + (0.376837)*sailStates.p + (-0.587231)*sailStates.q + (0.049653)*sailStates.r + (-0.000127)*sailStates.de;

	Cl = (1.623927)*sailStates.alpha + (-0.149122)*sailStates.beta + (-1.844089)*sailStates.p + (15.538524)*sailStates.q + (0.450933)*sailStates.r + (0.001513)*sailStates.de;
	Cm = (-14.075273)*sailStates.alpha + (-0.254797)*sailStates.beta + (11.596443)*sailStates.p + (-157.078247)*sailStates.q + (-1.081664)*sailStates.r + (-0.070473)*sailStates.de;
	Cn = (-0.119960)*sailStates.alpha + (-0.029795)*sailStates.beta + (-1.065813)*sailStates.p + (6.251319)*sailStates.q + (-0.049145)*sailStates.r + (0.000278)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end