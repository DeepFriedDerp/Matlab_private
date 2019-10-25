function [aeroForces] = paramSpace_1_1_2_1_2_3_1(sailStates,airStates)

	CL = (5.499273)*sailStates.alpha + (0.338995)*sailStates.beta + (-1.474076)*sailStates.p + (20.701799)*sailStates.q + (1.676356)*sailStates.r + (0.008843)*sailStates.de;
	CD = -2.099600;
	CY = (-0.413464)*sailStates.alpha + (-0.023346)*sailStates.beta + (0.933324)*sailStates.p + (-0.589408)*sailStates.q + (0.164570)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.116674)*sailStates.alpha + (-0.335913)*sailStates.beta + (-0.456041)*sailStates.p + (1.757731)*sailStates.q + (1.728746)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-16.033991)*sailStates.alpha + (-1.324648)*sailStates.beta + (6.771582)*sailStates.p + (-110.634644)*sailStates.q + (-5.507503)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (1.957174)*sailStates.alpha + (-0.087126)*sailStates.beta + (-2.157030)*sailStates.p + (10.215215)*sailStates.q + (-0.061339)*sailStates.r + (0.000320)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end