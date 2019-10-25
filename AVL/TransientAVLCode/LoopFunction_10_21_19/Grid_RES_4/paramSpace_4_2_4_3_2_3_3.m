function [aeroForces] = paramSpace_4_2_4_3_2_3_3(sailStates,airStates)

	CL = (4.094943)*sailStates.alpha + (0.135128)*sailStates.beta + (-2.779577)*sailStates.p + (39.821503)*sailStates.q + (1.761903)*sailStates.r + (0.011091)*sailStates.de;
	CD = -0.172800;
	CY = (0.038377)*sailStates.alpha + (-0.025204)*sailStates.beta + (0.577482)*sailStates.p + (-0.194781)*sailStates.q + (-0.114889)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.405512)*sailStates.alpha + (-0.241125)*sailStates.beta + (-1.399859)*sailStates.p + (12.705289)*sailStates.q + (1.411900)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-12.416547)*sailStates.alpha + (-0.526044)*sailStates.beta + (8.533308)*sailStates.p + (-141.871536)*sailStates.q + (-5.900342)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.286374)*sailStates.alpha + (0.055595)*sailStates.beta + (-1.051422)*sailStates.p + (3.800787)*sailStates.q + (-0.016589)*sailStates.r + (0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end