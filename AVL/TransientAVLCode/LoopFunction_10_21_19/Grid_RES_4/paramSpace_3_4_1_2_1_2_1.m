function [aeroForces] = paramSpace_3_4_1_2_1_2_1(sailStates,airStates)

	CL = (3.998886)*sailStates.alpha + (-0.057728)*sailStates.beta + (-2.137489)*sailStates.p + (31.462223)*sailStates.q + (0.467096)*sailStates.r + (0.010731)*sailStates.de;
	CD = 0.013490;
	CY = (-0.110408)*sailStates.alpha + (-0.024285)*sailStates.beta + (0.161002)*sailStates.p + (-0.668511)*sailStates.q + (-0.010482)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.959727)*sailStates.alpha + (-0.081880)*sailStates.beta + (-0.816778)*sailStates.p + (6.071272)*sailStates.q + (0.309740)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.423643)*sailStates.alpha + (0.118590)*sailStates.beta + (7.263506)*sailStates.p + (-124.743294)*sailStates.q + (-1.546772)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.204753)*sailStates.alpha + (0.002994)*sailStates.beta + (-0.315087)*sailStates.p + (1.953488)*sailStates.q + (0.003481)*sailStates.r + (0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end