function [aeroForces] = paramSpace_1_1_2_3_2_3_2(sailStates,airStates)

	CL = (3.869381)*sailStates.alpha + (-0.060887)*sailStates.beta + (-2.411012)*sailStates.p + (32.708427)*sailStates.q + (-0.321747)*sailStates.r + (0.009973)*sailStates.de;
	CD = -0.058470;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.075881)*sailStates.p + (0.000000)*sailStates.q + (0.015094)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.263217)*sailStates.alpha + (-0.060040)*sailStates.beta + (-1.185454)*sailStates.p + (9.811483)*sailStates.q + (-0.079962)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.269273)*sailStates.alpha + (0.214367)*sailStates.beta + (8.536906)*sailStates.p + (-133.820877)*sailStates.q + (1.139207)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.244138)*sailStates.alpha + (-0.013976)*sailStates.beta + (-0.382000)*sailStates.p + (2.528597)*sailStates.q + (-0.045004)*sailStates.r + (0.000037)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end