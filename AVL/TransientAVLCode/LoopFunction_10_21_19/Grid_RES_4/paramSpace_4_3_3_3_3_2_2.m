function [aeroForces] = paramSpace_4_3_3_3_3_2_2(sailStates,airStates)

	CL = (3.811611)*sailStates.alpha + (-0.066404)*sailStates.beta + (-2.494240)*sailStates.p + (35.225758)*sailStates.q + (0.865321)*sailStates.r + (0.010594)*sailStates.de;
	CD = 0.083350;
	CY = (0.061498)*sailStates.alpha + (-0.025514)*sailStates.beta + (0.151118)*sailStates.p + (0.489618)*sailStates.q + (-0.030042)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.141886)*sailStates.alpha + (-0.113378)*sailStates.beta + (-1.156132)*sailStates.p + (9.683926)*sailStates.q + (0.583069)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-13.609328)*sailStates.alpha + (0.250563)*sailStates.beta + (8.334283)*sailStates.p + (-135.545776)*sailStates.q + (-2.933863)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.191220)*sailStates.alpha + (0.020637)*sailStates.beta + (-0.158363)*sailStates.p + (-0.388094)*sailStates.q + (-0.038790)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end